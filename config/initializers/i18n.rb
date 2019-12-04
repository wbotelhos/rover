# frozen_string_literal: true

Rails.application.config.i18n.tap do |i18n|
  i18n.default_locale = :pt
  i18n.load_path += Dir[Rails.root.join('config/locales/**/*.yml').to_s]
end
