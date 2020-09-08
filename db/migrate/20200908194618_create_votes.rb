class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :voter, null: false, index: true, foreign_key: { to_table: 'users' }
      t.references :comment, null: false, index:true, foreign_key: true
      t.boolean :upvote

      t.timestamps
    end
  end
end
