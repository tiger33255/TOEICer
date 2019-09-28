class AddUserIdToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :user_id, :integer, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC'
  end
end
