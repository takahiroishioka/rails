Rails.application.routes.draw do
  
  post "staffs/:id/create" => "staffs#create", as: :join_staff
  post "staffs/:id/destroy" => "staffs#destroy", as: :destroy_staff
  
  get 'calenders/index'
  get "calenders/:id/edit" => "calenders#edit", as: :edit_calender
  post "calenders/:id/update" => "calenders#update"
  post "calenders/:id/destroy" => "calenders#destroy", as: :destroy_calender
  post"calenders/:id/create" => "calenders#create"

  get "messages/:id/" => "messages#index"  

  get "tasks/list" => "tasks#list"  
  get "tasks/:id/" => "tasks#index"
  
  
  get "offers/:id/new" => "offers#new"
  get "offers/:id/edit" => "offers#edit", as: :re_join_request_form
  post "offers/:id/update" => "offers#update", as: :re_join_request
  post "offers/:id/create" => "offers#create", as: :join_request
  
  get 'users/list'
  get "/login_form" => "users#login_form" 
  get "/new" => "users#new"
  post "/login" => "users#login"
  post "/logout" => "users#logout"
  post "/create" => "users#create"
  get "users/:id" => "users#index" 
  get "users/:id/edit" => "users#edit"
  post"users/:id/update" => "users#update"
  post"users/:id/destroy" => "users#destroy"

  get "works/list" => "works#list"
  get "works/:id/index" => "works#index" #このIDはUser_id
  get "works/:id/new" => "works#new" #このIDもUser_id
  post "works/:id/create" => "works#create" #ここから下IDはwork_id
  get "works/:id" => "works#show"
  get "works/:id/edit" => "works#edit"
  post "works/:id/update" => "works#update"
  post "works/:id/destroy" => "works#destroy"
  
  get "charas/:id" => "charas#index" #:idはwork_id
  get "charas/:id/new" => "charas#new"
  get "charas/:id/edit" => "charas#edit"
  post "charas/:id/create" => "charas#create"
  post "charas/:id/update" => "charas#update"
  post "charas/:id/destroy" => "charas#destroy"
  
  get "sections/:id" => "sections#index"
  get "sections/:id/new" => "sections#new"
  post "sections/:id/create" => "sections#create"
  post "sections/:id/destroy" => "sections#destroy", as: :destroy_section

  post "const_sections/:id/create" => "const_sections#create"

  get "members/:id/new" => "members#new"
  post "members/:id/create" => "members#create"

  get "scripts/:id" => "scripts#show"
  get "scripts/new" => "scripts#new"  

  
  


  
  get "calenders/:id/index" => "calenders#index"
  
  get "/" => "home#top"
    resources :scripts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
