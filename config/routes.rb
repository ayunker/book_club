Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "up" => "rails/health#show", :as => :rails_health_check

  # Defines the root path route ("/")
  root "archive#index"

  resources :meetings do
    resources :books
  end

  resources :archive, only: [:index]

  resources :votes, only: [:create, :destroy]
end
