class Test < ApplicationRecord
  def self.tests_with_category(category)
    category_id = Category.find_by(title: category).id
    Test.where(category_id: category_id).order(id: :desc)
  end
end
