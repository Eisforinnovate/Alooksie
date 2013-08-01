class CreatePersonalMessages < ActiveRecord::Migration
  def change
    create_table :personal_messages do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :content
      t.boolean :anonymous

      t.timestamps
    end
  end
end
