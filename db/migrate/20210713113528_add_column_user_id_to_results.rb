class AddColumnUserIdToResults < ActiveRecord::Migration[6.1]
  def change
    add_column(:results, :user_id, :integer)
  end
end
