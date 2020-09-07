class RemoveColumnsFromPost < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :positive, :string
    remove_column :posts, :negative, :string
    remove_column :posts, :severe, :boolean
    remove_column :posts, :category, :string
  end
end
