class Badge < ApplicationRecord
  # has_many :users
  enum action_type: { test: 1, category: 2, level: 3 }
end
