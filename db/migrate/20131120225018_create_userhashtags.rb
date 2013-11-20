class CreateUserhashtags < ActiveRecord::Migration
  def change
    create_table :userhashtags do |t|
      t.integer :user_id
      t.integer :hashtag_id

      t.timestamps
    end
  end
end
