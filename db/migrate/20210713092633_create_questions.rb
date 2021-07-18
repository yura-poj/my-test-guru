class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :body, null:false
      t.references :test

      t.timestamps
    end
  end
end
