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
  get "/councils/:id", to: redirect("/constituency/%{id}", status: 301)
  get "/europarl/:id", to: redirect("/constituency/%{id}", status: 301)

  get "/party/:id", to: redirect("/group/%{id}", status: 301)

  get "bundles/whoismytdmain/images/headshots/:_/:_", to: redirect("/", status: 404)

  get "/ge16", to: redirect("/body/2016-general-election", status: 301)
  get "/se16", to: redirect("/body/2016-seanad-election", status: 301)

  get "/group/anti-austerity-alliance", to: redirect("/group/solidarity", status: 301)

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :search
  get "/person/:letter" => 'person#index', :letter => /[a-zA-Z]/, as: :person_by_letter
  resources :person
  resources :body, only: %i[index show]
  resources :body_type, only: [:show]
  resources :constituency
  resources :group, only: %i[index show]
  resources :group_type, only: [:show]

  get "/group_type", to: redirect("/group")
  get "/body_type", to: redirect("/body")

  get "/sitemap.xml.gz", to: redirect("https://s3-eu-west-1.amazonaws.com/whoismytd/sitemap.xml.gz", status: 301)

  root 'welcome#index'
end
