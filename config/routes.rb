Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :recipes do
    collection do
      get 'my'
      get 'favorite'
    end

    member do
      get 'add_favorite'
    end
  end
  resources :kitchens, except: :destroy
  resources :food_types, except: :destroy
  resources :preferences, except: :destroy
end
