class AddTimerToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :timer, :integer, default: 5, null: false
  end
end
