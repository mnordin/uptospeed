UpToSpeed::Application.routes.draw do

  match "/auth/:provider/callback" => "sessions#sign_in"
  match "/auth/failure" => "sessions#failure"
  match "/signout" => "sessions#sign_out", :as => :signout

  match "/users/:id/levels_info" => "users#levels_info", :as => :levels_info

  match "/events/:id/map" => "events#map", :only => "get", :as => :event_map
  match "/events/:id/attend" => "events#attend", :only => "post", :as => :event_attend

  match "/events/appcache" => "events#appcache", :as => :appcache
  match "/manifest" => "events#manifest", :as => :appcache_manifest

  resources :users, :events, :learnings, :workouts

  root :to => 'events#index'
end
