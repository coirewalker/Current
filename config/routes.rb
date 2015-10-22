Rails.application.routes.draw do

  get 'artists/index'

  get 'artists/show'

  root 'home#index'
 
  get '/index', to: 'home#index'
  post '/index', to: 'home#index'

  get '/show/:users_zip', to: 'home#show', as: 'show_zip'
  post '/show', to: 'home#zip'
  

end
