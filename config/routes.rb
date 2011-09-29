UpToSpeed::Application.routes.draw do

  match "/auth/:provider/callback" => "authentications#create"
  match "/auth/failure" => "authentications#failure", :as => "auth_failure"

  resources :authentications, :users, :events

  root :to => 'events#index'
end
