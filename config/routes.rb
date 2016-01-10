Rails.application.routes.draw do
  # get 'users/show'

  # get 'incoming/create'

  # TODO change to limit to only required routes
  # resources :bookmarks
  resources :topics do
    resources :bookmarks, except:[:index]
  end

  resources :bookmarks, only: [] do
    resources :likes, only: [:create, :destroy]
  end

  # REVIEW advantage/convention for each way of doing this?
  # get 'home/about'
  get 'about' => 'home#about'

  devise_for :users
  resources :users, only: [:show]

  get 'home' => 'home#index'

  post :incoming, to: 'incoming#create'

  root to: "home#index"
end
