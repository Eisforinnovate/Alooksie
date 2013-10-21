class DropPersonalMessages < ActiveRecord::Migration
  def up
  	drop_table :personal_messages
  end

  def down
  end
end
