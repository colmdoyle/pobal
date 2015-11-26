Rails.application.routes.draw do
  get "/404" => "errors#not_found"
  get "/500" => "errors#internal_server_error"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :search
  resources :person
  resources :body
  resources :body_type
  resources :constituency
  resources :group
  resources :group_type

  root 'welcome#index'
end
