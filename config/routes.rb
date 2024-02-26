Rails.application.routes.draw do
  resources :genera
  resources :plants
  resources :families
  resources :watertrackers
  resources :sunlight_hours
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#index"
end
