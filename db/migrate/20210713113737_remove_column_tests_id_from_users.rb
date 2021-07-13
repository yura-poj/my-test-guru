class RemoveColumnTestsIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column(:users, :tests_id)
  end
end
