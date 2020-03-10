require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Astar
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', 'err_item', '*.{yml}')]
    config.i18n.available_locales = ['en', 'zh-CN', 'ko']
    # config.enable_dependency_loading = true

    config.autoload_paths += %W(#{config.root}/lib)
    config.eager_load_paths += %W(#{config.root}/lib)
    config.time_zone = "Asia/Shanghai"
    config.active_record.default_timezone = :utc # Or :utc
    config.i18n.default_locale = "zh-CN"
  end
end
