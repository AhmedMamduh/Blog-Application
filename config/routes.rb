require 'sidekiq/web'

Rails.application.routes.draw do
  
  mount Sidekiq::Web => '/sidekiq'

  post '/login', to: 'authentication#login'
  post '/signup', to: 'authentication#signup'
  get '/*a', to: 'application#not_found'
  resources :posts do
    resources :comments, only: [:create, :update, :destroy]
  end

end