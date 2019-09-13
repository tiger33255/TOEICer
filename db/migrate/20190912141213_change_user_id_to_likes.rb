class ChangeUserIdToLikes < ActiveRecord::Migration[5.2]
  def up
    change_column_null :likes, :user_id, false, 0
    change_column :likes, :user_id, :integer, default: 0
  end

  def down
    change_column :likes, :user_id, :integer
  end
end
