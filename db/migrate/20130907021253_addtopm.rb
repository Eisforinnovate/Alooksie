class Addtopm < ActiveRecord::Migration
  def up

  end

   def change
    add_column :personal_messages, :reply, :int
    add_column :personal_messages, :read, :boolean
  end

  def down
  end
end
