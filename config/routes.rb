Rails.application.routes.draw do
  # トップページを表示するルーティング
  root 'rooms#index'
  
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
