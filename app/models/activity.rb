# == Schema Information
#
# Table name: activities
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  activity_type :integer
#  amount        :decimal(36, 18)
#  order_id      :integer
#  state         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_activities_on_order_id  (order_id)
#  index_activities_on_user_id   (user_id)
#

class Activity < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :order, optional: true
  has_many :account_version, as: :modifiable

  enum :activity_type => {
    :registe => 1, #注册
    :direct_reward => 2, #直接奖励
    :node_reward => 3, #节点奖励计划分红
    :vip_reward => 4, #vip管理奖
    :super_reward => 5 #超级节点管理奖
  }

  enum :state => {
    :submitted => 1,
    :done => 2
  }

  aasm :column => :state, :whiny_transitions => false do
    state :submitted, initial: true
    state :done

    event :success, after_commit: [:plus_funds] do
      transitions from: :submitted, to: :done
    end
  end

  def title
    case activity_type
    when "registe"
      "新用户注册"
    when "direct_reward"
      "星群会员直推奖励"
    when "node_reward"
      "节点奖励计划分红"
    when "vip_reward"
      "星群VIP管理奖"
    when "super_reward"
      "星群超级节点管理奖"
    end
  end

  def description
    case activity_type
    when "registe"
      "新用户注册成为星群会员"
    when "direct_reward"
      "直推伙伴用户参与计划奖励"
    when "node_reward"
      "#{order.product.price rescue ''}币七天节点奖励计划"
    when "vip_reward"
      "成为星群VIP分享直推奖金的50%"
    when "super_reward"
      "成为星群超级节点分享额外0.25%"
    end
  end

  private

  def plus_funds
    if activity_type == 'registe'
      user.account('activity_balance').plus_funds(amount, :reason => :reward, :ref => self)
    else
      user.account.plus_funds(amount, :reason => :reward, :ref => self)
    end
  end
end
