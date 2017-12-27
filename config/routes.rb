Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :friendships, only: [:create, :destroy]

  get "/", to: "sessions#new", as: "signin"
  post "/sessions", to: "sessions#create"

end
