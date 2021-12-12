class ApplicationController < ActionController::Base
  NOT_NEEDED_PATHS = %w[/login /signup].freeze

  before_action :set_locale

  # def default_url_options
  #   return { lang: I18n.locale } if I18n.locale != I18n.default_locale
  #   {}
  # end

  private

  def after_sign_in_path_for(resource)
    return admin_tests_path if current_user.is_a?(Admin)

    root_path
  end

  def set_wish_path
    cookies[:wish_path] = full_url_for if path_needed?
  end

  def path_needed?
    NOT_NEEDED_PATHS.each { |path| return false if full_url_for.include?(path) }

    true
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
