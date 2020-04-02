Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  root "static_pages#home"
  # get 'static_pages/help'
  get '/help', to: 'static_pages#help' # 名前付きpathを設定する書き方
  # get 'static_pages/about'
  get '/about', to: 'static_pages#about'
  # get 'static_pages/contact'
  get 'contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :edit, :create, :update]
end
