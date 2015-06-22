Rails.application.routes.draw do

  get 'artists/index'

  get 'artists/show'

  root 'home#index'
 
  get '/index', to: 'home#index'
  post '/index', to: 'home#index'

  get '/show/:zipcode', to: 'home#show'
  post '/show', to: 'home#show'
  

end
