Rails.application.routes.draw do
  get '/new', to: "users#new", as: "signup"

  root "static_pages#home"
  # get 'static_pages/help'
  get '/help', to:'static_pages#help' # 名前付きpathを設定する書き方
  # get 'static_pages/about'
  get '/about', to: 'static_pages#about'
  # get 'static_pages/contact'
  get 'contact', to: 'static_pages#contact'
end
