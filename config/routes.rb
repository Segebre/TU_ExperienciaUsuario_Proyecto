Rails.application.routes.draw do
  resources :sessions

  resources :donations

  resources :comments

  resources :campaigns

  

  root 'welcome#index'

  # Users
  get    '/join', to: 'users#new', as: :new_user
  post   '/join', to: 'users#create'
  get    '/profile/edit', to: 'users#edit', as: :edit_user
  get    '/profile', to: 'users#show', as: :user
  patch  '/profile', to: 'users#update'
  put    '/profile', to: 'users#update'
  #delete '/users/:id', to: 'users#destroy'
  resources :users, :except => [:index]
  

  # Sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
