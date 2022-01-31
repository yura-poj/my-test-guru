class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85.freeze

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_create :next_step
  before_update :before_update_next_question

  attr_reader :step

  delegate :title, to: :test, prefix: true

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    next_step
    save!
  end

  def completed?
    current_question.nil?
  end

  def result_in_percents
    return 0 if correct_questions.zero?

    (correct_questions.to_f / test.questions.size) * 100
  end

  def success?
    result_in_percents >= SUCCESS_PERCENT
  end

  private

  def next_step
    @step ||= 0
    @step += 1
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    return false unless answer_ids.present?

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_update_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
