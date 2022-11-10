Rails.application.routes.draw do
  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :players
      resources :boards
      resources :games
      # Defines the root path route ("/")
      # root "articles#index"
    end
  end
end
