class ApplicationController < ActionController::Base
  NOT_NEEDED_PATHS = %w[/login /signup].freeze

  private

  # def after_sign_in_path_for(user)
  #   # redirect_to admin_tests_path if user.type == Admin
  # end

  def set_wish_path
    cookies[:wish_path] = full_url_for if path_needed?
  end

  def path_needed?
    NOT_NEEDED_PATHS.each { |path| return false if full_url_for.include?(path) }

    true
  end
end
