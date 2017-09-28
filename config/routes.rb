Rails.application.routes.draw do
  devise_for :users
  
  resources :wikis 
  resources :collaborators, only: [:create, :destroy]
  resources :charges, only: [:new, :create, :destroy]
  
  get 'about' => 'welcome#about'
  
  root 'welcome#index'
 
end
