class Category < ApplicationRecord
  belongs_to :test
  default_scope { order(title: :asc) }

  validates :title, presence: true
end
