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
  get "/users/:user_id", to: "users#show", as: "user"
  # edit
  get "/users/:user_id/edit", to: "users#edit", as: "edit_user"
  # update
  patch "/users/:user_id", to: "users#update", as: "update_user"
  put "/users/:user_id", to: "users#update"
  # delete
  delete "/users/:user_id", to: "users#destroy", as: "delete_user"
    
  #events
  get "/users/:user_id/events", to: "events#index", as: "events"
  get "/users/:user_id/events/new", to: "events#new", as: "new_event"
  post "/users/:user_id/events", to: "events#create"
  #show all vote details (render scores)
  # what the fucking fuck is wrong with this??
  # get "/users/:user_id/events/:event_id", "events#show", as: "event"
  # create event done by vote logic, just need tp edit/update
  # edit event. 
  get "/users/:user_id/events/:event_id/edit", to: "events#edit", as: "edit_event"
  patch "/users/:user_id/events/:event_id", to: "events#update", as: "update_event"
  put "/users/:user_id/events/:event_id", to: "events#update"
  delete "/users/:user_id/events", to: "events#destroy", as: "delete_event"

  #sessions
  get "/signin", to: "sessions#new", as: "sign_in"
  #create session,mmn
  post "/sessions", to: "sessions#create"
  #logout session
  delete "/sessions", to: "sessions#destroy", as: "logout_user"

  #messages
  #show all
  get "/users/:user_id/messages", to: "messages#index", as: "messages"
  #create new msg
  get "/users/:user_id/messages/new", to: "messages#new", as: "new_message"
  # post new msg
  post "/users/:user_id/messages", to: "messages#create"
  #show full msg details... might not need this
  get "/users/:user_id/messages/:message_id", to: "messages#show", as: "message"
  #edit msg ... might not need this
  get "/users/:user_id/messages/:message_id/edit", to: "messages#edit", as: "edit_message"
  #update
  patch "/users/:user_id/messages/:messages_id", to: "messages#update", as: "update_message"
  put "/users/:user_id/messages/:messages_id", to: "users#update"
  #delete
  delete "/users/:user_id/messages", to: "messages#destroy", as: "delete_message"

end
