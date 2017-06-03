class CreateVotes < ActiveRecord::Migration[5.1]
	def change
		create_table :votes do |t|
			t.integer :user_id
			t.integer :post_id
			t.integer :vote_total
			t.timestamps
		end
		add_index :votes, :user_id, unique: true
		add_index :votes, :post_ud, unique: true
	end
end
