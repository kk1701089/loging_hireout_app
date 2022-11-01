Rails.application.routes.draw do
  # ログイン関連のルーティング
  get '/login', to: 'sessions/new'
  post '/login', to: 'sessions#create'
  # usersに関するルーティング
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'

  # トップページを表示するルーティング
  root 'rooms#index'
  # roomsに関するルーティング
  get 'rooms/index'
  get 'rooms/search'
  get 'rooms/show'
  get 'rooms/new'
  get 'rooms/edit'

  # hostsに関するルーティングを一括指定
  resources :hosts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'tops/search', to: 'tops#search'
  # Defines the root path route ("/")
  # root "articles#index"
end
