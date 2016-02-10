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
      get  'recommend'
      post 'recommend', to: 'recipes#send_recommend'
    end
  end
  resources :kitchens, except: :destroy
  resources :food_types, except: :destroy
  resources :preferences, except: :destroy
  resources :users, except: :destroy
end
