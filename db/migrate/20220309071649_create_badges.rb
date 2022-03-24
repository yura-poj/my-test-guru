class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.integer :action_type, index: true, null: false
      t.string :image_url
      t.references :test, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
