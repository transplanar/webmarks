Rails.application.routes.draw do
  resources :topics do
    resources :bookmarks, except:[:index]
  end

  resources :bookmarks, only: [] do
    resources :likes, only: [:create, :destroy]
  end

  get 'about' => 'home#about'

  devise_for :users
  resources :users, only: [:show]

  get 'home' => 'home#index'

  post :incoming, to: 'incoming#create'

  root to: "home#index"
end
