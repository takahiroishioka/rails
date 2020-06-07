Rails.application.routes.draw do
  
  get "messages/:id/" => "messages#home"  

  get "tasks/list" => "tasks#list"  
  get "tasks/:id/" => "tasks#home"
  get "tasks/:id/re_join_request_form" => "tasks#re_join_request_form", as: :re_join_request_form
  post "tasks/re_join_request" => "tasks#re_join_request", as: :re_join_request

  get 'users/list'
  get "users/login_form" => "users#login_form" 
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "users/:id" => "users#home" 
  get "users/:id/works" => "users#works"

  get "works/list" => "works#list"
  post "works/invite" => "works#invite"
  post "works/chara_create" => "works#chara_create"
  get "works/:id/create_section_form" => "works#create_section_form"
  post "works/:id/const_section" => "works#const_section"
  post "works/:id/add_section_form" => "works#add_section"
  post "works/:id/destroy_section" => "works#destroy_section", as: :destroy_section
  get "works/:id/create_form" => "works#create_form"
  post "works/:id/create" => "works#create"
  get "works/:id/chara" => "works#chara"
  get "works/:id/join_request_form" => "works#join_request_form"
  post "works/:id/join_request" => "works#join_request", as: :join_request
  get "works/:id/chara_edit_form" => "works#chara_edit_form"
  post "works/:id/chara_edit" => "works#chara_edit"
  post "works/:id/chara_destroy" => "works#chara_destroy"
  get "works/:id/chara_create_form" => "works#chara_create_form"
  get "works/:id/script" => "works#script"
  get "works/:id/invite_member_form" => "works#invite_member_form"
  get "works/:id" => "works#home"

  
  get "/" => "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
