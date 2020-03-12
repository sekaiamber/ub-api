# == Schema Information
#
# Table name: users
#
#  id                               :integer          not null, primary key
#  nickname                         :string(255)
#  password_digest                  :string(255)
#  invite_code                      :string(255)
#  phone_number                     :string(255)
#  vip_level                        :integer          default("normal")
#  parent_id                        :integer
#  lft                              :integer          not null
#  rgt                              :integer          not null
#  depth                            :integer          default(0), not null
#  children_count                   :integer          default(0), not null
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  api_token                        :string(255)
#  auto_receive                     :boolean          default(FALSE)
#  community_level                  :integer          default(0)
#  gift_community_level             :integer          default(0)
#  gift_community_level_need_expire :boolean          default(TRUE)
#
# Indexes
#
#  index_users_on_invite_code   (invite_code) UNIQUE
#  index_users_on_lft           (lft)
#  index_users_on_nickname      (nickname) UNIQUE
#  index_users_on_parent_id     (parent_id)
#  index_users_on_phone_number  (phone_number) UNIQUE
#  index_users_on_rgt           (rgt)
#

class User < ApplicationRecord
  class CurrencyNotFoundError < StandardError; end
  has_secure_password
  attr_reader :verify_code
  acts_as_nested_set :counter_cache => 'children_count'

  validates :nickname, uniqueness: true, presence: true
  validates :invite_code, uniqueness: true
  validates :phone_number, uniqueness: true, presence: true
  before_create :generate_invite_code

  after_create :add_activity

  has_many :activities
  has_many :orders
  has_many :accounts
  has_one :id_document
  has_many :deposits
  has_many :withdraws

  enum :vip_level => {
    :normal => 0,
    :vip => 1,
    :super => 2
  }

  def account(currency)
    currency_id = case currency
    when Currency
      currency.id
    when Integer
      currency
    else
      lc = Currency.find_by(code: currency.to_s)
      raise CurrencyNotFoundError, code: currency unless lc
      lc.id
    end
    begin
      accounts.find_or_create_by currency_id: currency_id
    rescue ActiveRecord::RecordNotUnique
      retry
    end
    # Account.send(ac_type).find_or_create_by(:user_id => id)
  end

  # def payment_address
  #   PaymentAddress.find_or_create_by(:account_id => account.id)
  # end

  def id_document
    IdDocument.find_or_create_by(:user_id => id, :state => 'verified')
  end

  def transfer_to(user, amount)
    t = Transfer.new
    t.from = self.account
    t.to = user.account('activity_balance')
    t.amount = amount
    t.save
  end

  def unlock_activity_balance(amount)
    if self.account('activity_balance').balance >= amount
      self.account('activity_balance').sub_funds(amount, :reason => :fix)
      self.account.plus_funds(amount, :reason => :fix)
    end
  end

  def can_buy?
    !orders.where(:created_at => [Date.today.beginning_of_day..Date.today.end_of_day]).exists?
  end

  def can_withdraw?(amount)
    history_amount = withdraws.where(:created_at => [Date.today.beginning_of_day..Date.today.end_of_day]).sum(:sum)
    history_amount + amount <= 6000
  end

  def add_activity
    if Settings.can_reward_after_registe?
      activity = activities.create(:activity_type => :registe, :amount => 100)
      activity.success!
    end
  end

  private
  #
  # 生成用户的邀请码
  #
  #
  # @return [void]
  #
  def generate_invite_code
    return if self.invite_code
    begin
      charset = Array('A'..'Z') + Array(0..9)
      self.invite_code = Array.new(6) { charset.sample }.join
    end while User.where(:invite_code => self.invite_code).any?
  end
end
