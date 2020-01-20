Rails.application.routes.draw do
  get 'sells/new'
  root to: 'products#index'
  resources :tests, only: [:index, :new, :create]
  get '/tmp', to: 'tmps#index'
  get '/logout', to: 'logouts#index'
  resource :mypage, only: [:show] do
    collection do
      get :identification
      get :profile
    end
  end
  resource :sell, only: [:new]
  get '/sell', to: 'sells#new'
end
