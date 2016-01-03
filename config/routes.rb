Rails.application.routes.draw do
  # TODO change to limit to only required routes
  # resources :bookmarks
  resources :topics do
    resources :bookmarks
  end

  # resources :topics do
    # resources :bookmarks, except: [:index]
  # end

  # REVIEW is this messing things up? should be nested?
  # get 'bookmarks' => 'bookmarks#index'

  # REVIEW advantage/convention for each way of doing this?
  # get 'home/about'
  get 'about' => 'home#about'

  devise_for :users
  resources :users

  root to: "home#index"
end
