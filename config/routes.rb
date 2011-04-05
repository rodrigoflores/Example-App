ExampleApp::Application.routes.draw do

  match "/auth/failure" => "authorizations#new"
  match "/auth/facebook/callback" => "authorizations#callback"
  match "/auth/logout" => "authorizations#logout"
  root :to => "authorizations#new"

  resources :pages, :only => [:index]
end
