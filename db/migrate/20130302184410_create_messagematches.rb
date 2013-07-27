class CreateMessagematches < ActiveRecord::Migration
  def change
    create_table :messagematches do |t|
      t.integer :user_id
      t.integer :message_id

      t.timestamps
    end
  end
end
