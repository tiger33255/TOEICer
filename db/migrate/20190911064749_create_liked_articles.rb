class CreateLikedArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :liked_articles do |t|

      t.timestamps
    end
  end
end
