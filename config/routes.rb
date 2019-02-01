Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "videos#index"

  get "categories", to: "categories#index"
  post "categories", to: "categories#new"
  delete "categories/:id", to: "categories#destroy", as: :category

end
