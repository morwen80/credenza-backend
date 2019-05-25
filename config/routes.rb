Rails.application.routes.draw do
  resources :lists, only: [:index, :show]
  resources :fooditems
  resources :faves
end
