class AddDefaltValueLevelToTests < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:tests, :level, 1 )
  end
end
