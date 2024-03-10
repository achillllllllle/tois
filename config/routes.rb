Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]

  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check

  get :my_feed, to: "pages#my_feed"

  resources :tois, only: %i[index show new create] do
    resources :bookmarks, only: %i[create]
  end

  resources :bookmarks, only: %i[index delete]

  resources :posts, only: %i[new create]
end
