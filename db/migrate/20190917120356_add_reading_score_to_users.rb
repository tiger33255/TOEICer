class AddReadingScoreToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :reading_score, :integer
  end
end
