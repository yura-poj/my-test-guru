class AddIndexes2 < ActiveRecord::Migration[6.1]
  def change
    add_index :categories, :title
    add_index :users, %i[ email first_name last_name]
  end
end
