class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :rating
      t.references :post, null: false, foreign_key: true
      t.references :commenter, null: false, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
