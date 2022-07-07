Rails.application.routes.draw do
  # ゲストログイン用
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
  end

  # 顧客用
  # URL/customers/sign_in
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    resources :customers, only: [:show, :edit, :update] do
      # 退会確認画面
      get 'comfirm' => 'customers#confirm', as: 'confirm'
      # 論理削除用のルーティング
      patch 'withdraw' => 'customers#withdraw', as: 'withdraw'
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

    resources :travel_memories do
      resource :favorites, only: [:create, :destroy]
      resources :travel_memory_comments, only: [:create, :destroy]
    end
    get 'search' => 'searches#search'
  end

  # 管理者用
  # URL/admin/sign_in
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    # get 'customers/index'
    # get 'customers/show'
    # get 'customers/edit'
  end
end
