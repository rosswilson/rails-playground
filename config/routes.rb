Rails.application.routes.draw do
  resources :users

  get 'register', to: "register#new"
  post 'register', to: "register#create"

  root to: "dashboard#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
