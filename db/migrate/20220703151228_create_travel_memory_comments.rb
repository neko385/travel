class CreateTravelMemoryComments < ActiveRecord::Migration[6.1]
  def change
    create_table :travel_memory_comments do |t|
      t.integer :customer_id,        null: false, default: ""
      t.integer :travel_memory_id,   null: false, default: ""
      t.text :comment,               null: false, default: ""

      t.timestamps
    end
  end
end
