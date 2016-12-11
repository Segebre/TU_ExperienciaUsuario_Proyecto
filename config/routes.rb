Rails.application.routes.draw do
  get 'donations/new'

  get 'comments/new'

  get 'campaigns/new'

  get 'campaigns/index'

  get 'campaigns/show'

  get 'campaigns/edit'

  get 'users/new'

  get 'users/show'

  get 'users/edit'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
