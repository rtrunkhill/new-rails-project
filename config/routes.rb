Rails.application.routes.draw do
  devise_for :users
  
  resources :wikis
  
  resources :charges, only: [:new, :create, :destroy]
  get '/downgrade', to: "charges#downgrade"

  
  get 'about' => 'welcome#about'
  
  root 'welcome#index'
 
end
