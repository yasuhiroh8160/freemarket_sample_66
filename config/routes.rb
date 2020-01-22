Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  # root to: 'products#index'
  # resources :tests, only: [:index, :new, :create]
  # get '/tmp', to: 'tmps#index'
  # get '/mypage', to: 'mypages#index'
  # get '/logout', to: 'logouts#index'
  
  root to: "signup#index"

  get 'sells/new'
  root to: 'products#index'
  resources :products, only: [:index]
  resource :product, only: [:show] do
    collection do
      get :buy_confirm
    end
  end

  resources :tests, only: [:index, :new, :create]
  get '/tmp', to: 'tmps#index'
  get '/logout', to: 'logouts#index'
  resource :mypage, only: [:show] do
    collection do
      get :identification
      get :profile
      get :card
    end
  end

  resource :sell, only: [:new]
  get '/sell', to: 'sells#new'

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
