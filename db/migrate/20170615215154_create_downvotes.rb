class CreateDownvotes < ActiveRecord::Migration[5.1]
	def change
		create_table :downvotes do |t|
			t.integer :value, default: -1
			t.integer :user_id
			t.integer :post_id
			t.timestamps
		end
	end
end
