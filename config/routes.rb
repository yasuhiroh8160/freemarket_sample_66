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
  resources :products, only: [:index, :show, :new, :create, :edit, :update] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_shipping_PayGuest', defaults: { format: 'json' }
      get 'get_shipping_PayFormer', defaults: { format: 'json' }
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
