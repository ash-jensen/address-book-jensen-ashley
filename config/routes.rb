Rails.application.routes.draw do
  resources :users
  resources :people
  # get 'addressbook/index'
  root 'addressbook#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
