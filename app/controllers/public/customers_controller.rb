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
      redirect_to customer_path
    else
      render :edit
    end
  end

  def confirm
  end

  def withdraw
    @customer = Customer.find(params[:customer_id])
    @travel_memories = @customer.travel_memories
    @customer.update(is_deleted: true)
    @travel_memories.destroy
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end


  private
  def customer_params
    params.require(:customer).permit(:screen_name, :last_name, :first_name, :last_kana, :first_kana, :email)
  end

end
