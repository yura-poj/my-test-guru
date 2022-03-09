class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.integer :action_type, index: true, null: false
      t.integer :object_id, null: false

      t.timestamps
    end
  end
end
