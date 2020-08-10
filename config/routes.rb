Rails.application.routes.draw do

  post '/login', to: 'authentication#login'
  post '/signup', to: 'authentication#signup'
  get '/*a', to: 'application#not_found'

end