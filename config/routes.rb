FoodTracker::Application.routes.draw do
  devise_for :users

  root to: 'activities#index'
end
