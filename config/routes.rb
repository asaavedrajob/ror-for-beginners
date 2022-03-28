Rails.application.routes.draw do
  # rails routes
  # => will show all routes/paths availables in our terminal

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

  # GET /about-us without changing the about_path reference in code
  # get "about-us", to: "about#index", as: :about

  # GET /sign_up
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
end
