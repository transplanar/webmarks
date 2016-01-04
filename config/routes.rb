Rails.application.routes.draw do
  # TODO change to limit to only required routes
  # resources :bookmarks
  resources :topics do
    resources :bookmarks
  end

  # REVIEW advantage/convention for each way of doing this?
  # get 'home/about'
  get 'about' => 'home#about'

  devise_for :users
  resources :users

  get 'home' => 'home#index'

  root to: "home#index"
end
