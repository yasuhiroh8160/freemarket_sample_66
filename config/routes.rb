Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  
 


  root to: 'products#index'
  resources :products, only: [:index, :show] do
    collection do
      get :buy_confirm
    end
  end

  get '/signup', to: "signup#index"

  resource :mypage, only: [:show] do
    collection do
      get :identification
      get :profile
      get :card
      get :logout
    end
  end

  resource :sell, only: [:new]
  get '/sell', to: 'sells#new'
  



  #以下作業用およびテスト用。

  resources :tests, only: [:index, :new, :create]
  get '/tmp', to: 'tmps#index'


  resources :registers, only: [:index] do
    collection do
      get :first
      get :second
      get :third
      get :forth
      get :fifth
    end
  end

end
