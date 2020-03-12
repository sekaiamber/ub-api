# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  user_id     :integer
#  unlock_at   :datetime
#  state       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  end_at      :datetime
#  reward      :decimal(36, 18)
#  power       :integer          default(0)
#  price       :decimal(36, 18)
#  currency    :string(255)      default("BASE")
#  base_count  :decimal(36, 18)  default(0.0)
#  currency_id :integer
#

class Order < ApplicationRecord
  include AASM
  belongs_to :user
  belongs_to :product
  has_many :activities
  validate :user_create_order_validation, :on => :create
  before_create :set_unlock_at
  after_create :lock_funds
  after_create :create_reward

  enum :state => {
    :submitted => 1,
    :done => 2
  }

  aasm :column => :state, :whiny_transitions => false do
    state :submitted, initial: true
    state :done

    event :success, after_commit: [:unlock_funds, :receive_reward, :reward_to_ancestors] do
      transitions from: :submitted, to: :done, :if => :can_unlock?
    end
  end

  def set_unlock_at
    self.unlock_at = Time.current + 7.days
  end

  def can_unlock?
    unlock_at <= Time.current
  end

  def lock_funds
    # user.account.lock_funds(product.price, :reason => :order_buy, :ref => self)
    activity_balance = user.account('activity_balance')
    if activity_balance.balance >= product.price
      activity_balance.transaction do
        activity_balance.sub_funds(product.price, :reason => :order_buy, :ref => self)
        user.account.plus_funds(product.price, :reason => :order_buy, :ref => self)
        user.account.lock_funds(product.price, :reason => :order_buy, :ref => self)
      end
    elsif activity_balance.balance > 0
      activity_balance.transaction do
        balance = activity_balance.balance
        activity_balance.sub_funds(balance, :reason => :order_buy, :ref => self)
        user.account.plus_funds(balance, :reason => :order_buy, :ref => self)
        user.account.lock_funds(product.price, :reason => :order_buy, :ref => self)
      end
    else
      user.account.lock_funds(product.price, :reason => :order_buy, :ref => self)
    end
  end

  def create_reward
    activities.create(:activity_type => :node_reward, :amount => product.reward, :user => user)
  end

  def unlock_funds
    user.account.unlock_funds(product.price, :reason => :order_unlock, :ref => self)
  end

  def receive_reward
    activities.find_by(:user => user).success!
  end

  def reward_to_ancestors
    activities.create(:activity_type => :direct_reward, :amount => product.price * 0.025.to_d, :user => user.parent).success!
    User.each_with_level(user.ancestors) do |ancestor, level|
      case ancestor.vip_level
      when 'vip'
        activities.create(:user => ancestor, :activity_type => :vip_reward, :amount => product.price * 0.025.to_d * (0.5.to_d ** (user.depth - level - 1))).success! if user.depth - level > 1
      when 'super'
        activities.create(:user => ancestor, :activity_type => :vip_reward, :amount => product.price * 0.025.to_d * (0.5.to_d ** (user.depth - level - 1))).success! if user.depth - level > 1
        # activities.create(:user => ancestor, :activity_type => :super_reward, :amount => product.price * 0.0025.to_d).success!
      end
    end
  end

  private
  def user_create_order_validation
    unless user.can_buy?
      errors.add(' ', '每日仅可参与一次，请明日再来')
    end
  end

end
