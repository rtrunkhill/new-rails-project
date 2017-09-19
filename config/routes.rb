Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  devise_for :users
  get 'welcome/index'
  
  get 'welcome/about'
  
  root 'welcome#index'
 
end
