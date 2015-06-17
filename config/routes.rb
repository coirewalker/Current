Rails.application.routes.draw do

  root 'home#index'
 
  get '/index', to: 'home#index'
  post '/index', to: 'home#index'

  get '/show', to: 'home#show'
  post '/show', to: 'home#show'
  

end
