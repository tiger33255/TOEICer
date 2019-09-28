class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|

      t.string :title, index: true
      t.text :body, index: true
      t.string :article_image_id, index: true

      t.timestamps
    end
  end
end
