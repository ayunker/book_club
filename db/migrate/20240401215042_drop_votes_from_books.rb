class DropVotesFromBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :votes, :integer
  end
end
