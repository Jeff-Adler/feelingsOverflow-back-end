class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :rating
      t.references :post, index: true, null: false, foreign_key: true
      t.references :commenter, index: true, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
