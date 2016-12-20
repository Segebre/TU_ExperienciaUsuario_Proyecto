Rails.application.routes.draw do

  root 'welcome#index'

  # Users
  get    '/join', to: 'users#new', as: :new_user
  post   '/join', to: 'users#create'
  get    '/profile/edit', to: 'users#edit', as: :edit_user
  get    '/profile', to: 'users#show', as: :user
  patch  '/profile', to: 'users#update'
  put    '/profile', to: 'users#update'
  resources :users, :except => [:index, :destroy]

  # Campaigns
  resources :campaigns do
    # Comments
      resources :comments, only: [:new, :create], on: :member
    # Donations
      resources :donations, only: [:new, :create], on: :member
    # Category Campaigns
    get 'category/:category', on: :collection, action: "category_campaigns", as: :category
    # Dashboard
    get 'dashboard', on: :collection, action: "dashboard_campaigns", as: :dashboard
  end

  # Sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# Defaults
  #get    '/defaults', to: 'defaults#index', as: :defaults
  #post   '/defaults', to: 'defaults#create'
  #get    '/defaults/new', to: 'defaults#new', as: :new_default
  #get    '/defaults/:id/edit', to: 'defaults#edit', as: :edit_default
  #get    '/defaults/:id', to: 'defaults#show', as: :default
  #patch  '/defaults/:id', to: 'defaults#update'
  #put    '/defaults/:id', to: 'defaults#update'
  #delete '/defaults/:id', to: 'defaults#destroy'