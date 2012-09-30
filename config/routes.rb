UpToSpeed::Application.routes.draw do

  match '/auth/:provider/callback' => 'sessions#sign_in'
  match '/auth/failure' => 'sessions#failure'
  match '/signout' => 'sessions#sign_out', :as => :signout

  match '/stats' => 'users#stats'

  resources :users do
    get 'levels_info', :on => :member
  end

  resources :events do
    member do
      get 'map'
      get 'new_attendees'
      post 'register_attendees'
      post 'attend'
    end
  end

  resources :learnings, :workouts

  root :to => 'events#index'
end
