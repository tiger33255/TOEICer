class ChangeDataArticleImageIdToArticle < ActiveRecord::Migration[5.2]
  def change
    change_column :article, :article_image_id, :text
  end
end
