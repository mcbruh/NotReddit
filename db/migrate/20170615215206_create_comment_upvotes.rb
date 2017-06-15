class CreateCommentUpvotes < ActiveRecord::Migration[5.1]
	def change
		create_table :comment_upvotes do |t|
			t.integer :value, default: 1
			t.integer :user_id
			t.integer :comment_id
			t.timestamps
		end
	end
end
