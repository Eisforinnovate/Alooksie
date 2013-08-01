class CreateMessagehashtags < ActiveRecord::Migration
  def change
    create_table :messagehashtags do |t|
      t.integer :message_id
      t.integer :hashtag_id

      t.timestamps
    end
  end
end
