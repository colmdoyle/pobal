Rails.application.routes.draw do
  # Custom Error Pages
  get "/404" => "errors#not_found"
  get "/500" => "errors#internal_server_error"

  # 302 Old whoismytd.com routes
  get "/councillor/:id", to: redirect("/person/%{id}", status: 301)
  get "/td/:id", to: redirect("/person/%{id}", status: 301)
  get "/senator/:id", to: redirect("/person/%{id}", status: 301)
  get "/candidate/:id", to: redirect("/person/%{id}", status: 301)
  get "/mep/:id", to: redirect("/person/%{id}", status: 301)

  get "/councils/entire-council/:id", to: redirect("/body/%{id}", status: 301)

  get "/dail/:id", to: redirect("/constituency/%{id}", status: 301)
  get "/council/:id", to: redirect("/constituency/%{id}", status: 301)
  get "/europarl/:id", to: redirect("/constituency/%{id}", status: 301)

  get "/party/:id", to: redirect("/group/%{id}", status: 301)

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :search
  resources :person
  resources :body, only: [:show]
  resources :body_type
  resources :constituency
  resources :group, only: [:show]
  resources :group_type

  get "/body", to: redirect("/body_type")
  get "/group", to: redirect("/group_type")

  root 'welcome#index'
end
