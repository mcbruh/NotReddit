class CreatePostDownvotes < ActiveRecord::Migration[5.1]
  def change
    create_table :post_downvotes do |t|

      t.timestamps
    end
  end
end
