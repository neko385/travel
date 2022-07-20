class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @range = params[:range]
    @keyword = params[:keyword]
    if @range == "Customer"
      @customer = Customer.search(params[:keyword])
    else
      @travel_memories = TravelMemory.order(created_at: :desc).page(params[:page]).per(10).search(params[:keyword])
    end
  end
end
