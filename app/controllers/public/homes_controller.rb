class Public::HomesController < ApplicationController

  def top
    @travel_memories = TravelMemory.all.order(created_at: :desc).limit(5)
  end

  def about
  end
end
