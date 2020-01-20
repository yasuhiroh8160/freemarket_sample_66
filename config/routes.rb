Rails.application.routes.draw do
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
