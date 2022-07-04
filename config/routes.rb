Rails.application.routes.draw do
  root to: 'public/homes#top'
  get 'public/about' => 'public/homes#about', as: 'about'
  # 顧客用
  # URL/customers/sign_in
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
  namespace :public do
    resources :customers, only: [:show, :edit, :update] do
      patch 'withdraw' => 'customers#withdraw', as: 'withdraw'
      get 'comfirm' => 'customers#confirm', as: 'confirm'
      # get 'customers/show'
      # get 'customers/edit'
      # get 'customers/confirm'
    end
    resources :travel_memories, only: [:index, :show, :edit, :update, :destroy] do
      resources :travel_memory_comments, only: [:create, :destroy]
      resource :favorite, only: [:create, :destroy]
    # get 'travel_memories/index'
    # get 'travel_memories/show'
    # get 'travel_memories/edit'
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
