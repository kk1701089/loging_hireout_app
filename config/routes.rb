Rails.application.routes.draw do
resources :hosts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # トップページを表示するルーティング
  root 'tops#search'
  get 'tops/search', to: 'tops#search'
  # Defines the root path route ("/")
  # root "articles#index"
end
