Rails.application.routes.draw do
  resources :entertainers
  resources :events
  resources :hosts
  get '/', to: 'application#welcome'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
