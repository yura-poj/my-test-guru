class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :questions

  has_many :tests_users
  has_many :users, through: :tests_users

  scope :by_level, ->(level) { where(level: level) }

  scope :easy, -> { by_level(0..1) }
  scope :norm, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }
  #scope :by_category, ->(category) { where(category_id: Category.find_by(title: category).id).order(id: :desc) }
  scope :by_category, -> (category_title) { joins(:category).where(categories: { title: category_title }).order(id: :desc) }

  validates :title, presence: true
  validates :level, numericality: { greater_than_or_equal_to: 1 }, :allow_nil => true
  validates :level, uniqueness: { scope: :title,
                                 message: "should be once per level" }

end
