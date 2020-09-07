class ChangeRatingToVotes < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :rating, :votes
  end
end

