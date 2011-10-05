UpToSpeed::Application.routes.draw do

  match "/auth/:provider/callback" => "sessions#create"
  match "/auth/failure" => "sessions#failure"
  match "/signout" => "sessions#destroy", :as => :signout

  match "/events/:id/attend" => "events#attend", :only => "post", :as => :event_attend

  resources :users, :events

  root :to => 'events#index'
end
