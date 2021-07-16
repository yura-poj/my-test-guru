class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validates :self.answers.size, numericality: { less_than: 5 } # , on: update
end
