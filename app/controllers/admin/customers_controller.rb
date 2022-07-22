class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path
    else
      render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:screen_name, :last_name, :first_name, :last_kana, :first_kana, :email, :is_deleted)
  end
end
