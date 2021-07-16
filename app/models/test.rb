class Test < ApplicationRecord
  has_one :category
  has_many :questions

  has_many :tests_users
  has_many :users , through: :tests_users

  scope :by_level, -> (level) {where(level: level)}

  scope :easy, -> {by_level(0..1)}
  scope :norm, -> {by_level(2..4)}
  scope :hard, -> {by_level(5..Float::INFINITY)}
  scope :by_category, -> (category) {Test.where(category_id: Category.find_by(title: category).id).order(id: :desc)}

  validates :title, presence: true
  validates :level, numericality: {only_integer: true }

end
