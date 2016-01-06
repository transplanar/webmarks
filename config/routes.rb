Rails.application.routes.draw do
  # get 'incoming/create'

  # TODO change to limit to only required routes
  # resources :bookmarks
  resources :topics do
    resources :bookmarks, except:[:index] do
      resources :likes, only: [:create, :destroy]
    end
  end

  # REVIEW advantage/convention for each way of doing this?
  # get 'home/about'
  get 'about' => 'home#about'

  devise_for :users
  resources :users

  get 'home' => 'home#index'

  post :incoming, to: 'incoming#create'

  root to: "home#index"
end
