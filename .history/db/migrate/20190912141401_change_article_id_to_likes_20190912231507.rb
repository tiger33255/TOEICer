class ChangeArticleIdToLikes < ActiveRecord::Migration[5.2]
  def up
    change_column_null :likes, :article_id, false, 0
    change_column :likes, :article_id, :integer, default: 0
  end

  def down
    change_column :likes, :article_id, :integer
  end
end
