Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "session#new"

  resources :npcs, except: [:show]
  resources :users, except: [:index]

  get "/locations/new_universe" => "locations#new_universe";
  resources :locations, except: [:index]

  post "/locations/new_universe" => "locations#create_universe"


  get "/login" => "session#new"
  post "/login" => "session#create"
  delete "/login" => "session#destroy"

  get "/locationtest" => "locations#test"

end
