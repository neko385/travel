class Public::FavoritesController < ApplicationController
  def create
    @travel_memory = TravelMemory.find(params[:travel_memory_id])
    favorite = current_customer.favorites.new(travel_memory_id: @travel_memory.id)
    favorite.save
  end

  def destroy
    @travel_memory = TravelMemory.find(params[:travel_memory_id])
    favorite = current_customer.favorites.find_by(travel_memory_id: @travel_memory.id)
    favorite.destroy
  end
end
