class CreateTravelMemoryComments < ActiveRecord::Migration[6.1]
  def change
    create_table :travel_memory_comments do |t|
      t.integer :customer_id,        null: false
      t.integer :travel_memory_id,   null: false
      t.text :comment,               null: false

      t.timestamps
    end
  end
end
