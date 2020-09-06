class AddPosterNameToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :poster_name, :string
  end
end
