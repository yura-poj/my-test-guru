class Test < ApplicationRecord
  has_one :category
  has_many :questions

  has_many :tests_users
  has_many :users , through: :tests_users

  scope :by_level, -> (level) {where(level: level)}

  scope :easy, -> {by_level(0..1)}
  scope :norm, -> {by_level(2..4)}
  scope :hard, -> {by_level(5..Float::INFINITY)}

  validates :title, presence: true
  validates :level, numericality: {only_integer: true }

  def self.tests_with_category(category)
    category_id = Category.find_by(title: category).id
    Test.where(category_id: category_id).order(id: :desc)
  end
end
