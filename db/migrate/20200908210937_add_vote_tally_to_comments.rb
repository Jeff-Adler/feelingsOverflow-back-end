class AddVoteTallyToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :vote_tally, :integer
  end
end
