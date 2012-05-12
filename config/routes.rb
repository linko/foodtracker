FoodTracker::Application.routes.draw do
  devise_for :users, :controllers => {
    sessions: "sessions"
  }

  resources :activities

  root to: 'activities#index'
end
