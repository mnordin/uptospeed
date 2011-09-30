UpToSpeed::Application.routes.draw do

  match "/auth/:provider/callback" => "sessions#create"
  match "/auth/failure" => "sessions#failure"
  match "/signout" => "sessions#destroy", :as => :signout

  resources :users, :events

  root :to => 'events#index'
end
