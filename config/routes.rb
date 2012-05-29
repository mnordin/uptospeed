UpToSpeed::Application.routes.draw do

  match "/auth/:provider/callback" => "sessions#sign_in"
  match "/auth/failure" => "sessions#failure"
  match "/signout" => "sessions#sign_out", :as => :signout

  match "/events/:id/map" => "events#map", :only => "get", :as => :event_map
  match "/events/:id/attend" => "events#attend", :only => "post", :as => :event_attend

  match "/events/appcache" => "events#appcache", :as => :appcache
  match "/manifest" => "events#manifest", :as => :appcache_manifest

  resources :users, :events

  root :to => 'events#index'
end
