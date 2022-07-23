class Public::HomesController < ApplicationController

  def top
    @travel_memories = TravelMemory.includes(:customer).where(customers: {is_deleted: false}).order(created_at: :desc).limit(5)
  end

  def about
  end
end
