FoodTracker::Application.routes.draw do
  resources :activities

  devise_for :users

  root to: 'activities#index'
end
