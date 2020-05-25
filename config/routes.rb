Rails.application.routes.draw do
  resources :users

  get 'register', to: "register#new"
  post 'register', to: "register#create"

  get 'register/confirm/:id', to: "email_confirmation#create", as: "email_confirmation"

  get 'signin', to: 'session#new'
  post 'signin', to: 'session#create'
  delete 'signout', to: 'session#destroy'

  root to: "dashboard#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
