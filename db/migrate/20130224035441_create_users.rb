class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :id
      t.integer :university_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
