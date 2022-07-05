class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @travel_memories = @customer.travel_memories
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to public_customer_path
    else
      render :edit
    end
  end

  def confirm
  end

  private
  def customer_params
    params.require(:customer).permit(:screen_name, :last_name, :first_name, :last_kana, :first_kana, :email)
  end
end
