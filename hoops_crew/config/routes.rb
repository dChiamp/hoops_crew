Rails.application.routes.draw do
  # need rout to landing page
  get "/", to: "landing_page#index", as: "landing_page"

  #users
  # root to: "users#index

  # show all
  get "/users", to: "users#index", as: "users"
  # create new prof
  get "/users/new", to: "users#new", as: "new_user"
  # create prof
  post "/users", to: "users#create"
  # show user details
  get "/users/:id", to: "users#show", as: "user"
  # edit
  get "/users/:id/edit", to: "users#edit", as: "edit_user"
  # update
  patch "/users/:id", to: "users#update", as: "update_user"
  put "/users/:id", to: "users#update"
  # delete
  delete '/users/:id', to: 'users#destroy', as: "delete_user"
    
  #events
  get "/events", to: "events#index", as: "events"

  #sessions
  get "/signin", to: "sessions#new", as: "sign_in"
  #create session
  post "/sessions", to: "sessions#create"
  #logout session
  delete "/sessions", to: "sessions#destroy", as: "logout_user"

  #messages
  #show all
  get "/messages", to: "messages#index", as: "messages"
  #create new msg
  get "/messages/new", to: "messages#new", as: "new_message"
  # post new msg
  post "/messages", to: "messages#create"
  #show full msg details... might not need this
  get "/messages/:id", to: "messages#show", as: "message"
  #edit msg ... might not need this
  get "/messages/:id/edit", to: "messages#edit", as: "edit_message"
  #update
  patch "/messages/:id", to: "messages#update", as: "update_message"
  put "/messages/:id", to: "users#update"
  #delete
  delete "/messages", to: "messages#destroy", as: "delete_message"

end
