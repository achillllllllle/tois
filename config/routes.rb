Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get :my_feed, to: "pages#my_feed"
  resources :tois, only: %i[index show new create] do
    resources :bookmarks, only: %i[create]
  end
  resources :bookmarks, only: %i[index delete]
  resources :users, only: %i[show]
end
