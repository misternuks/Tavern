Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  get 'users/:id', to: 'users#show', as: :user
  resources :dm_profiles, only: %i[index show new create] do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[index show update]
end

# took edit and update out of the embedded bookings
