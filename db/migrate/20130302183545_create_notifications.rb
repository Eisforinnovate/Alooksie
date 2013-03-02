class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :content
      t.integer :user_id
      t.integer :message_id

      t.timestamps
    end
  end
end
