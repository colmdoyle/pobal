Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :search
  resources :person
  resources :body
  resources :group
  
  root 'welcome#index'
end
