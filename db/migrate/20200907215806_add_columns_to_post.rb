class AddColumnsToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :mood_rating, :string
    add_column :posts, :mood_length, :string
    add_column :posts, :mood_location, :string
    add_column :posts, :mood_trigger, :string
    add_column :posts, :mood_trigger_detail, :string
    add_column :posts, :mood_description, :string
    add_column :posts, :mood_purpose, :string
    add_column :posts, :mood_title, :string
    add_column :posts, :mood_category, :string
    add_column :posts, :mood_category_detail, :string
  end
end
