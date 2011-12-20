UpToSpeed::Application.routes.draw do

  match "/auth/:provider/callback" => "sessions#sign_in"
  match "/auth/failure" => "sessions#failure"
  match "/signout" => "sessions#sign_out", :as => :signout

  match "/circles/:id/remove_user" => "circles#remove_circle_membership", :only => "post", :as => :remove_circle_membership
  match "/circles/:id/settings" => "circles#settings", :only => "get", :as => :circle_settings
  match "/events/:id/map" => "events#map", :only => "get", :as => :event_map
  match "/events/:id/attend" => "events#attend", :only => "post", :as => :event_attend

  match "/manifest" => "application#manifest", :as => :manifest

  resources :users, :events, :circles

  root :to => 'events#index'
end
