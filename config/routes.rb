Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :recipes, except: :destroy
  resources :kitchens, except: :destroy
  resources :food_types, except: :destroy
  resources :preferences, except: :destroy
end
