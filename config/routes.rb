Rails.application.routes.draw do
  resources :bookmarks
  resources :topics
  # REVIEW advantage/convention for each way of doing this?
  # get 'home/about'
  get 'about' => 'home#about'

  devise_for :users
  resources :users

  root to: "home#index"
end
