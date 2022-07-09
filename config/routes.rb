Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # resources :users, only: [:show, :create, :destroy, :update]
      post 'login', to: 'sessions#login', as: :login
      resources :pets, only: [:index, :show, :create, :destroy, :update] do
        member do
          post 'upload'
        end
      end
        resources :bookings, only: [:create]
      end
      resources :bookings, only: [:index, :show, :destroy, :update]
    end
  end
end
