require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

module Codeblack
  class Application < Rails::Application
    I18n.enforce_available_locales = false
  end
end
