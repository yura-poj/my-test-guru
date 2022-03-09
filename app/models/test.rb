class Test < ApplicationRecord
  LESS_VALUE_OF_TIMER = 5.freeze
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :questions
  has_many :badges
  has_many :test_passages
  has_many :users, through: :test_passages

  enum level: { easy: 0, elementary: 1, advanced: 2, hard: 3, hero: 4 }

  scope :by_level, ->(level) { where(level: level) }
  scope :by_category, lambda { |category_title|
                        joins(:category).where(categories: { title: category_title }).order(id: :desc)
                      }

  validates :title, :timer, presence: true
  validates :level, inclusion: levels.keys
  validates :level, uniqueness: { scope: :title,
                                  message: 'should be once per level' }
  validates :timer, numericality: { only_integer: true, greater_than_or_equal_to: LESS_VALUE_OF_TIMER}
end
