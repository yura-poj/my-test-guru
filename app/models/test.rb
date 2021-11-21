class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :questions

  has_many :test_passages
  has_many :users, through: :test_passages

  enum level: { easy: 0, elementary: 1, advanced: 2, hard: 3, hero: 4 }

  scope :by_level, ->(level) { where(level: level) }
  scope :by_category, lambda { |category_title|
                        joins(:category).where(categories: { title: category_title }).order(id: :desc)
                      }

  validates :title, presence: true
  validates :level, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :level, uniqueness: { scope: :title,
                                  message: 'should be once per level' }
end
