Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "main#index"
  # GET / optional
  # root to: "main#index"
  # get "/", to: "main#index"
  # get "", to: "main#index"

  # GET /about
  get "about", to: "about#index"
  # GET /about optional
  # get "/about", to: "about#index"
end
