Rails.application.routes.draw do
  # REVIEW is this correct? better alternative to all these get statements?
  # get 'home/index'

  # get 'home/about'

  devise_for :users

  root to: "home#index"
end
