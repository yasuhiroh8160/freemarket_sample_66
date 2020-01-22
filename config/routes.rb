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
end
