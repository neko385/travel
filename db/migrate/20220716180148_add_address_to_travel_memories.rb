class AddAddressToTravelMemories < ActiveRecord::Migration[6.1]
  def change
    add_column :travel_memories, :address, :string
    add_column :travel_memories, :latitude, :float
    add_column :travel_memories, :longitude, :float
  end
end
