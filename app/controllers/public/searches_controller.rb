class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @range = params[:range]
    @keyword = params[:keyword]
    if @range == "Customer"
      @customer = Customer.search(params[:keyword])
    else
      @travel_memories = TravelMemory.search(params[:keyword])
    end
  end
end
