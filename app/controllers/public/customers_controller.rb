class Public::CustomersController < ApplicationController
  before_action :ensure_guest_customer, only: [:edit]

  def show
    @customer = Customer.find(params[:id])
    @travel_memories = @customer.travel_memories.order(created_at: :desc).page(params[:page]).per(10)
  end

  def edit
    @customer = Customer.find(params[:id])
    if @customer != current_customer
      redirect_to customer_path(@customer)
    end
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

  def favorites
    @customer = Customer.find(params[:id])
    @favorites = Favorite.where(customer_id: @customer.id).pluck(:travel_memory_id)
    @favorite_travel_memories = TravelMemory.find(@favorites)
    # @favorite_index = @customer.favorites.page(params[:page]).per(10)
  end


  private
  def customer_params
    params.require(:customer).permit(:screen_name, :last_name, :first_name, :last_kana, :first_kana, :email)
  end

  def ensure_guest_customer
    @customer = Customer.find(params[:id])
    if @customer.screen_name == "guestuser"
      redirect_to customer_path(current_customer), notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません'
    end
  end

end
