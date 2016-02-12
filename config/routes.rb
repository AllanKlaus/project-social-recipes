Rails.application.routes.draw do
  # scope "(:locale)", locale: /en|pt/ do
    devise_for :users, controllers: { registrations: 'registrations' }
    root 'home#index'
    resources :recipes do
      collection do
        get 'my'
        get 'favorite'
        post 'search'
      end

      member do
        get 'add_favorite'
        get 'remove_favorite'
        get  'recommend'
        post 'recommend', to: 'recipes#send_recommend'
      end
    end
    resources :kitchens
    resources :food_types
    resources :preferences
    resources :users, only: :show
  # end
end
