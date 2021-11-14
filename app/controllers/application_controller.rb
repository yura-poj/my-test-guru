class ApplicationController < ActionController::Base
  NOT_NEEDED_PATHS = %w[/login /signup].freeze
  before_action :authenticate_user!

  helper_method :current_user, :logged_in?

  private

  def authenticate_user!
    unless current_user
      set_wish_path
      redirect_to login_path, alert: 'Log in, please'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def set_wish_path
    cookies[:wish_path] = full_url_for if path_needed?
  end

  def path_needed?
    NOT_NEEDED_PATHS.each { |path| return false if full_url_for.include?(path)}

    true
  end
end
