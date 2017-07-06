class CreateSentMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :sent_messages do |t|

      t.timestamps
    end
  end
end
