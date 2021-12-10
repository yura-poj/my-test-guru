class LanguageController < ApplicationController
  before_action :set_wish_path

  def change_language
    I18n.locale = I18n.locale == :ru ? :en : :ru
  end
end
