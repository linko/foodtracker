FoodTracker::Application.routes.draw do
  devise_for :users
    #:controllers => {
    #  sessions: "sessions",
    #  registrations: "registrations"
    #}

  resources :activities

  root to: 'activities#index'
end
