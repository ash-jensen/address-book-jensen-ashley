Rails.application.routes.draw do
  resources :phone_numbers
  resources :emails
  # Users Routes
  resources :users, except: [:new]
  get "sign-up", to: "users#new"
  
  # Sessions Routes
  get "sign-in", to: "sessions#new"
  post "sign-in", to: "sessions#create"
  delete "sign-out", to: "sessions#destroy"
  
  # Addresses Routes
  resources :addresses

  # People Routes
  resources :people
  root 'people#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
