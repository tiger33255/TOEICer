class Articles < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :article?_image_id, :text
  end
end
