Rails.application.routes.draw do
  resources :sessions

  resources :donations

  resources :comments

  resources :campaigns

  resources :users, :except => [:new]

  root 'welcome#index'

  # Users
  get '/join', to: 'users#new', as: :new_user
  #post '/join/:id', to: 'users#create'

  # Sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
