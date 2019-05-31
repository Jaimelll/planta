Rails.application.routes.draw do
 
  
  resources :details
  resources :elements
  resources :products
  resources :formulas
  
 devise_for :admin_users, ActiveAdmin::Devise.config
 ActiveAdmin.routes(self) 

# root 'admin/products#index'

root 'admin/dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
