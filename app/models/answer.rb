class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  scope :right, -> { where(correct: true) }
end
