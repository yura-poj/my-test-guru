class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  after_validation :before_validation_set_first_question, on: :create
  after_validation :next_step, on: :create
  #after_update :next_question

  attr_reader :step

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    next_step
    self.current_question = next_question
    save!
  end

  def complited?
    current_question.nil?
  end

  def result_in_procents
    return 0 if correct_questions == 0

    (test.questions.size / correct_questions.to_f) * 100
  end

  private

  def next_step
    @step ||= 1
    @step += 1
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
