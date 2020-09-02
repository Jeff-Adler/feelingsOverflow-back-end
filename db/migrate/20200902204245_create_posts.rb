class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :positive
      t.string :negative
      t.boolean :severe
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
