Rails.application.routes.draw do
  get 'collaborators/create'

  get 'collaborators/destroy'

  devise_for :users
  
  resources :wikis
  
  resources :charges, only: [:new, :create, :destroy]
  
  get 'about' => 'welcome#about'
  
  root 'welcome#index'
 
end
