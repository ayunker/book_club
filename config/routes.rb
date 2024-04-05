Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "meetings#current"

  resources :meetings do
    resources :books
  end

  resources :votes, only: [:create, :destroy]
end
