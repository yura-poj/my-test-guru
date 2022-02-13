class FeedbackController < ApplicationController
  def create
    FeedbackMailer.feedback(email: params[:email], theme: params[:theme], problem: params[:problem]).deliver_now
    redirect_back fallback_location: root_path
  end

  private
end
