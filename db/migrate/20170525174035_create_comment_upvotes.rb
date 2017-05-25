class CreateCommentUpvotes < ActiveRecord::Migration[5.1]
	def change
		create_table :comment_upvotes do |t|
			t.integer :comment_id
			t.integer :user_id
			t.timestamps
		end
	end
end
