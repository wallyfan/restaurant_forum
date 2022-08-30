Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show, :edit, :update]

  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]

    # 瀏覽所有餐廳的最新動態
    collection do
      get :feeds
    end

    member do
      get :dashboard
      post :favorite
      post :unfavorite
    end

  end

  resources :categories, only: :show
  root "restaurants#index"

  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end

end
