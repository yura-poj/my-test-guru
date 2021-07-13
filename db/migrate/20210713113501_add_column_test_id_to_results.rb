class AddColumnTestIdToResults < ActiveRecord::Migration[6.1]
  def change
    add_column(:results, :test_id, :integer)
  end
end
