class ChangeDataArticleImageIdToArticles < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :article_image_id, :text
  end
end
