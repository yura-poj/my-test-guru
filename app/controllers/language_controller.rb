class LanguageController < ApplicationController
  before_action :set_wish_path

  def change_language
    I18n.default_locale = I18n.default_locale == :ru ? :en : :ru
    redirect_back fallback_location: root_path
  end
end
