class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :questions

  has_many :tests_users
  has_many :users, through: :tests_users

  enum level: { easy: 0, elementary: 1, advanced: 2, hard: 3, hero: 4 }.freeze

  scope :by_level, ->(level) { where(level: level) }
  scope :by_category, -> (category_title) { joins(:category).where(categories: { title: category_title }).order(id: :desc) }

  validates :title, presence: true
  validates :level, numericality: { greater_than_or_equal_to: 1 }, :allow_nil => true
  validates :level, uniqueness: { scope: :title,
                                 message: "should be once per level" }

end
