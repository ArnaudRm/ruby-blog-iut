class AddFieldsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :picture, :string
    add_column :posts, :chapeau, :string
    add_column :posts, :content, :string
    add_column :posts, :title, :string
  end
end
