class AddStepToTestPassages < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :step, :integer, null: false, default: 0
  end
end
