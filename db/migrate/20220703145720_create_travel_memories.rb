class CreateTravelMemories < ActiveRecord::Migration[6.1]
  def change
    create_table :travel_memories do |t|
      t.integer :customer_id,       null: false
      t.string :place,              null: false, default: ""
      t.text :introduction,         null: false
      t.timestamps
    end
  end
end
