class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.boolean :correct, default:false
      t.references :user
      t.references :question

      t.timestamps
    end
  end
end
