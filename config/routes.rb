Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "videos#index"
  get "videos/:id", to: "videos#show", as: :video
  get "videos", to: "videos#new"
  post "videos", to: "videos#create"
  delete "videos/:id", to: "videos#destroy"


  get "categories", to: "categories#index"
  post "categories", to: "categories#new"
  delete "categories/:id", to: "categories#destroy", as: :category
  get "categories/:id", to: "categories#show"

  post "comments", to: "comments#new"

end
