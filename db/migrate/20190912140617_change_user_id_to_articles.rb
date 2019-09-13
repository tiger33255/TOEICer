class ChangeUserIdToArticles < ActiveRecord::Migration[5.2]
  def up
    change_column_null :articles, :user_id, false, 0
    change_column :articles, :user_id, :integer, default: 0
  end

  def down
    change_column :articles, :user_id, :integer
  end
end
