# == Schema Information
#
# Table name: mobile_apps
#
#  id            :integer          not null, primary key
#  name          :integer
#  version       :string(50)
#  secret        :string(32)
#  app_key       :string(32)
#  deprecated_at :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_mobile_apps_on_app_key           (app_key)
#  index_mobile_apps_on_name_and_version  (name,version) UNIQUE
#

class MobileApp < ApplicationRecord
  before_create :generate_key
  #
  # Constants
  #
  enum :name => {
    :iOS   => 1,
    :android => 2
  }


  #
  # Validations
  #
  validates :version, uniqueness: { scope: :name }

  #
  # 是否已经废弃不支持
  #
  #
  # @return [Boolean]
  #
  def deprecated?
    deprecated_at.present?
  end

  #
  # 将当前 MobileApp 设置为废弃的
  #
  #
  # @return [void]
  #
  def deprecate!
    self.update(:deprecated_at => Time.current)
  end

  def encode(payload)
    JWT.encode(payload, secret)
  end
  def decode(code)
    JWT.decode(code, secret)[0]
  end

  def upgrade_info
    info = {}
    info.merge!({:school_version => '1.0.1', :school_url => 'https://assets.bitrabbit.com/upload/796fe015-67b4-4f16-95f5-8363ff395f70.dex'})
    if deprecated?
      if self.name == 'iOS'
        url = "itms-services://?action=download-manifest&url=https://www.astarapp.net/astar_#{MobileApp.iOS.last.version}.plist"
      else
        url = "https://www.astarapp.net/astar_#{MobileApp.android.last.version}.apk"
      end
      info.merge!({
        :force_upgrade => true,
        :info => '当前版本已经过期，请下载新版本，如无法下载请删除本app后到官网重新下载。',
        :url => url
      })
    end
    info
  end

  private
  def generate_key
    self.app_key ||= SecureRandom.hex(10)
    self.secret ||= SecureRandom.hex(16)
  end

end
