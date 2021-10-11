class AddBodyToAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :body, :string
  end
end
