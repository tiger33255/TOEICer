class AddListeningScoreToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :listening_score, :integer
  end
end
