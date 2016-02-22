Rails.application.routes.draw do

  # need rout to landing page
  get "/", to: "landing_page#index", as: "landing_page"

  #users
  # root to: "users#index"

  get "/users", to: "users#index", as: "users"
  
  get "/users/new", to: "users#new", as: "new_user"

  post "/users", to: "users#create"

  get "/users/:id", to: "users#show", as: "user"

  get "/users/:id/edit", to: "users#edit", as: "edit_user"

  patch "/users/:id", to: "users#update", as: "update_user"
  put "/users/:id", to: "users#update"

  delete '/users/:id', to: 'users#destroy', as: 'delete_user'
end
