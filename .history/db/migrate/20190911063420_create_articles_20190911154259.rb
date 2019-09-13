class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|

      t.string :title, index: true
      t.text :body, index: true
      t.string :article_image, index: true

      t.timestamps
    end
  end
end
