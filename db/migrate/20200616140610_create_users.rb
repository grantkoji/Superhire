class CreateUsers < ActiveRecord::Migration[6.0]
  def change 
    create_table :users do |t| 
      t.string :username
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :location
      t.boolean :is_hero?, default: false
      t.string :name, default: nil
      t.integer :intelligence, default: 0
      t.integer :strength, default: 0
      t.integer :speed, default: 0
      t.integer :durability, default: 0
      t.integer :power, default: 0
      t.integer :combat, default: 0
      t.integer :alignment, default: "good"
      t.string :img_url, default: nil
      t.integer :price, default: 0
      t.boolean :is_premium?, default: nil
    end
  end
end
