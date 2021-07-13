class AddDefaltValueCorrectToAnswers < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:answers, :correct, false)
  end
end
