module QuestionsHelper
  def question_header(question, test)
    "#{action_text(question)} #{test.title} Question"
  end

  private

  def action_text(question)
    return 'Create new' if question.new_record?

    'Edit'
  end
end
