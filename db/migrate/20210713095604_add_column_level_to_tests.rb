class AddColumnLevelToTests < ActiveRecord::Migration[6.1]
  def change
    add_column(:tests, :level, :integer)
  end
end
