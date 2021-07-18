class Answer < ApplicationRecord
  MAX_NUMBER_OF_ANSWERS = 4
  belongs_to :question
  belongs_to :user

  scope :right, -> { where(correct: true) }
  validate :validation_max_answers

  def validation_max_answers
    errors.add(:answers, "can't be more than 4") if Answer.where(question_id: question_id).size >= MAX_NUMBER_OF_ANSWERS
  end
end
