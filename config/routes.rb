UpToSpeed::Application.routes.draw do

  match "/auth/:provider/callback" => "sessions#create"
  match "/auth/failure" => "sessions#failure"
  match "/signout" => "sessions#destroy", :as => :signout

  match "/circles/:id/remove_user" => "circles#remove_circle_membership", :only => "post", :as => :remove_circle_membership
  match "/circles/:id/settings" => "circles#settings", :only => "get", :as => :circle_settings
  match "/circles/:id/map" => "events#map", :only => "get", :as => :event_map
  match "/events/:id/attend" => "events#attend", :only => "post", :as => :event_attend

  resources :users, :events, :circles

  root :to => 'events#index'
end
