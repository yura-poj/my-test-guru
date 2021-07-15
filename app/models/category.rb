class Category < ApplicationRecord
  belongs_to :test
  default_scope {order(title: :asc)}
end
