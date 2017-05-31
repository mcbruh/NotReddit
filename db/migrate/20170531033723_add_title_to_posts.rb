class AddTitleToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :title, :string
    add_index :posts, :title
  end
end
