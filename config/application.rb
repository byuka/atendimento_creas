require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AtendimentoCreas
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    I18n.available_locales = [:en, :"pt-BR"]
    config.i18n.default_locale = :"pt-BR"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.to_prepare do
      Clearance::PasswordsController.layout "signin"
      Clearance::SessionsController.layout "signin"
      Clearance::UsersController.layout "signin"
    end

  end
end
