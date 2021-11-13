class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[create new]

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:wish_path].presence || root_path
    else
      flash.now[:alert] = 'Verify your email and password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil
    redirect_to login_path, alert: 'Log out'
  end
end
