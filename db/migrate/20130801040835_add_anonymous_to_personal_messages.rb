class AddAnonymousToPersonalMessages < ActiveRecord::Migration
  def change
    add_column :personal_messages, :anonymous, :boolean
  end
end
