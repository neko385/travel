class Public::TravelMemoriesController < ApplicationController
  def new
    @travel_memory = TravelMemory.new
  end

  def create
    @travel_memory = TravelMemory.new(travel_memory_params)
    if @travel_memory.save
      redirect_to public_travel_memory_path(@travel_memory)
    else
      render :new
    end
  end

  def index
    @travel_memories = TravelMemory.all
  end

  def show
    @travel_memory = TravelMemory.find(params[:id])
  end

  def edit
    @travel_memory = TravelMemory.find(params[:id])
  end

  def update
    @travel_memory = TravelMemory.find(params[:id])
    if @travel_memory.update(travel_memory_params)
      redirect_to public_travel_memory_path
    else
      render :edit
    end
  end

  private
  def travel_memory_params
    params.require(:travel_memory).permit(:customer_id, :place, :introduction, :image)
  end
end
