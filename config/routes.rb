Rails.application.routes.draw do
  resources :messages
  resources :entertainers
  resources :events
  resources :hosts
  get '/', to: 'application#welcome'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/host_signup', to: 'sessions#host_signup'
  post '/host_signup', to: 'hosts#create'
  get '/entertainer_signup', to: 'sessions#entertainer_signup'
  post '/entertainer_signup', to: 'entertainers#create'
  post '/post', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  patch '/update_events', to: 'entertainers#update_events'
  patch '/update_entertainers', to: 'hosts#update_entertainers'
  post '/search', to: 'events#search'
  post '/filter', to: 'entertainers#filter'
  get '/reply/:id', to: 'messages#reply'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
