Rails.application.routes.draw do

  post '/superheros', to: 'superheros#search'

  # get '/search', to: 'searches#search', as: 'search_page'

  # get '/superheros', to: 'superheros#result', as: 'results_page'

  resources :superheros 

  resources :users
  # get '/login', to: 'sessions#new', as: 'login'
  # post '/login', to: 'sessions#create'
  # delete '/logout', to: 'sessions#destroy', as: :logout 

  post '/users/:id', to: "appointments#new"

  resources :appointments 
  resources :sessions 

  post '/sessions/new', to: 'sessions#create'

  post '/superheros/:id', to: "appointments#new"
  resources :searches

  # get '/superheros/:id', to: 'users#client', as: 'client'
  # get '/users/:id', to: 'users#heroes', as 'hero'
  # get '/appointments/new', to: 'users#customer', as 'customer'
  # get '/appointments/new', to: 'users#customer', as 'customer'



  # get 'appointments/index'
  # get 'superheros/index'
  # get 'users/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end 