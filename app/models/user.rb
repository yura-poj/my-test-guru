class User < ApplicationRecord
  def tests_by_level(level)
    Test.where(id: Result.where(id: self.id).test_id).where(level: level)
  end
end
