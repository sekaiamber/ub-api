require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

module Clockwork
  # every(1.minutes, 'Unlock activity balance') {
  #   puts '==============Unlock activity balance started========='
  #   Activity.registe.submitted.each do |activity|
  #     puts "------Unlock #{activity.id} ---------"
  #     activity.success! if activity.user.account.amount >= 900
  #   end
  #   puts '==============Unlock activity balance ended========='
  #  }
  every(1.day, 'Update user level', :at => '16:00'){
    puts '==============='
    order_ids = Order.pluck(:user_id)
    User.normal.find_each do |user|
      if user.account.amount >= 5000 && ((order_ids & user.children.pluck(:id)).length >= 5)
        user.update(:vip_level => 1)
      end
    end
    User.vip.find_each do |user|
      user.update(:vip_level => 0) if (user.account.amount < 5000 || ((order_ids & user.children.pluck(:id)).length < 5))
    end
  }
  every(1.day, 'Unlock Super VIP', :at => '16:00'){
    puts '==============='
    [{:user_id => 547, :count => 10}, {:user_id => 469, :count => 9}, {:user_id => 473, :count => 20}, {:user_id => 560, :count => 19}].each do |info|
      user = User.find(info[:user_id])
      if user.account.versions.where(:reason => Account::SUPER_VIP_UNLOCK).count < info[:count]
        user.account.unlock_funds(15000, :reason => :super_vip_unlock)
      end
    end
    
  }
end
