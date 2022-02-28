class FeedbackMailer < ApplicationMailer
  def feedback(params:)
    @email = params[:email]
    @theme = params[:theme]
    @problem = params[:problem]

    mail to: ENV['FEEDBACK_CONTACT']
  end
end
