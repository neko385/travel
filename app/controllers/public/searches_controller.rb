class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @range = params[:range]
    @keyword = params[:keyword]
    if @range == "Customer"
      @customer = Customer.where(customers: {is_deleted: false}).order(created_at: :desc).page(params[:page]).per(10).search(params[:keyword])
    else
      @travel_memories = TravelMemory.includes(:customer).where(customers: {is_deleted: false}).order(created_at: :desc).page(params[:page]).per(10).search(params[:keyword])
    end
  end
end