class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :tests_id

      t.timestamps
    end
  end
end
