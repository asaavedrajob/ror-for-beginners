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

  # DELETE /logout
  delete "logout", to: "sessions#destroy"

  # GET /sign_in
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  # GET /edit_password
  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  # GET /password/reset
  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"
end
