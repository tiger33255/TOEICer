class AddWordToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Word, :string, index: true
  end
end
