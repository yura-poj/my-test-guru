class User < ApplicationRecord
  has_many :answers
  def tests_by_level(level)
    Test.where(id: Result.where(id: id).test_id).where(level: level)
  end
end
