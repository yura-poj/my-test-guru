class User < ApplicationRecord

  include Auth

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_test, class_name: 'Test'

  scope :new_users, -> (date) { where('created_at > date', date) }

  has_secure_password

  def tests_by_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
