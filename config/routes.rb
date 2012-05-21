FoodTracker::Application.routes.draw do

  devise_for :users,
  :controllers => {
  #sessions: "sessions",
  registrations: "registrations"
  }

  resources :activities
  resources :reports, except: [:destroy, :update ]

  root to: 'activities#index'
end
