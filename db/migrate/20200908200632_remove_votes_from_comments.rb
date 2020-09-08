class RemoveVotesFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :votes, :integer
  end
end
