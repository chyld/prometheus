Prometheus::Application.routes.draw do
  root to: 'home#index'

  resources :users, :only => [:show] do
    collection do
      get :register, action: :new
      post :register, action: :create
      get :login
      post :login, action: :authenticate
      delete :login, action: :logout
      get :password
      post :password, action: :password_reset
    end
  end

  resources :curricula, :only => [:index]
end
