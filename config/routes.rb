UpToSpeed::Application.routes.draw do

  match "/auth/:provider/callback" => "authentications#create"
  match "/auth/failure" => "authentications#failure", :as => "auth_failure"

  resources :authentications, :users

  root :to => 'users#index'
end
