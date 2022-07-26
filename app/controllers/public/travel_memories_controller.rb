class Public::TravelMemoriesController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]


  def new
    @travel_memory = TravelMemory.new
  end

  def create
    @travel_memory = TravelMemory.new(travel_memory_params)
    if @travel_memory.save
      redirect_to travel_memory_path(@travel_memory)
    else
      render :new
    end
  end

  def index
    @travel_memories_map = TravelMemory.all
    @travel_memories = TravelMemory.includes(:customer).where(customers: {is_deleted: false}).order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @travel_memory = TravelMemory.find(params[:id])
    @customer = @travel_memory.customer
    @travel_memory_comment = TravelMemoryComment.new
  end

  def edit
    @travel_memory = TravelMemory.find(params[:id])
    if @travel_memory.customer != current_customer
      redirect_to travel_memories_path
    end
  end

  def update
    @travel_memory = TravelMemory.find(params[:id])
    if @travel_memory.update(travel_memory_params)
      redirect_to travel_memory_path
    else
      render :edit
    end
  end

  def destroy
    @travel_memory = TravelMemory.find(params[:id])
    @travel_memory.destroy
    redirect_to travel_memories_path
  end

  private
  def travel_memory_params
    params.require(:travel_memory).permit(:customer_id, :place, :introduction, :image, :latitude, :longitude)
  end
end