class FeedbackMailer < ApplicationMailer
  def feedback(email:, theme:, problem:)
    @email = email
    @theme = theme
    @problem = problem

    mail to: ENV['FEEDBACK_CONTACT']
  end
end
