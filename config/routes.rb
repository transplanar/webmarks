Rails.application.routes.draw do
  # REVIEW is this correct? better alternative to all these get statements?
  # get 'home/index'

  # REVIEW advantage/convention for each way of doing this?
  # get 'home/about'
  get 'about' => 'home#about'

  devise_for :users
  resources :users

  root to: "home#index"
end
