class RemoveUserFromAnswers < ActiveRecord::Migration[6.1]
  def change
    remove_reference :answers, :user, null: false, foreign_key: true
  end
end
