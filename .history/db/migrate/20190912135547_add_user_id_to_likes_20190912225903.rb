class AddUserIdToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :user_id, :integer, null: false, default: ''
    add_column :likes, :article_id, :integer, null: false, default: ''
  end
end
