class CreateEarnedBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :earned_badges do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :badge, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
