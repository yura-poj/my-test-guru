class FeedbackController < ApplicationController
  def create
    alert = nil
    if mailer_params.values.any?(&:blank?)
      alert = "Error: feedback's fields can't be blank"
    else
      FeedbackMailer.feedback(params: mailer_params).deliver_now
    end
    redirect_back fallback_location: root_path, alert: alert
  end

  private

  def mailer_params
    params.permit(:email, :theme, :problem)
  end
end
