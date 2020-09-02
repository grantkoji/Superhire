class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.integer :minimum_price
      t.integer :maximum_price
      t.integer :minimum_intelligence
      t.integer :minimum_strength
      t.integer :minimum_speed
      t.integer :minimum_durability
      t.integer :minimum_power
      t.integer :minimum_combat
      t.string :location
      t.timestamps
    end
  end
end

