class CreateSuperheros < ActiveRecord::Migration[6.0]
  def change
    create_table :superheros do |t|
      t.string :name
      t.integer :intelligence
      t.integer :strength
      t.integer :speed
      t.integer :durability
      t.integer :power
      t.integer :combat
      t.string :aalignment
      t.string :img_url
      t.integer :price
      t.integer :website_id

      t.timestamps
    end
  end
end
