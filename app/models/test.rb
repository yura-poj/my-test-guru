class Test < ApplicationRecord
  has_one :category
  has_many :questions

  has_many :tests_users
  has_many :users , through: :tests_users

  def self.tests_with_category(category)
    category_id = Category.find_by(title: category).id
    Test.where(category_id: category_id).order(id: :desc)
  end
end
