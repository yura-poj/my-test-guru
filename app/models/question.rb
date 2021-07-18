class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  #validates :answers.size, numericality: { less_than: 5 } # , on: update
end
