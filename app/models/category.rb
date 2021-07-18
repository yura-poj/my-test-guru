class Category < ApplicationRecord
  has_many :test
  default_scope { order(title: :asc) }
  validates :title, presence: true
end
