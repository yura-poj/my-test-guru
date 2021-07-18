class AddAuthorIdToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :author_id, :bigint, foreign_key:  { to_table: :users }
  end
end
