Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :cocktails, only: [:index, :show, :create, :update]
  resources :ingredients, only: [:index, :show]
  resources :measurements, only: [:create]
end
