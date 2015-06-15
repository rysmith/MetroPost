Rails.application.routes.draw do

  #send site visitors to the index page first
  root 'welcome#index'

  #landing page
  get 'welcome/' => 'welcome#index', as: :welcome

  #show all the users
  get 'users/' => 'users#index', as: :users

  #GET the sign-up form, then POST the results to the db
  get 'users/new' => 'users#new', as: :new_user
  post '/users' => 'users#create', as: :create_user

  #GET the login form, then create a new session
  get 'sessions/new' => 'sessions#new', as: :new_session
  post 'sessions/create' => 'sessions#create',as: :create_session

  #once the user clicks logout, destroy the current session
  get 'sessions/destroy' => 'sessions#destroy', as: :destroy_session

  #show all the comments
  get 'comments/index' => 'comments#index', as: :comments

  #GET the new comment form, then POST the results to the db
  get 'comments/new' => 'comments#new', as: :new_comment
  post 'comments/create' => 'comments#create', as: :create_comment

  #GET the edit comment form, then POST the new info to the db
  get 'comments/:id/edit' => 'comments#edit', as: :edit_comment
  patch 'comments/:id' => 'comments#update'

  #DELETE a particular comment in the db
  delete 'comments/:id' => 'comments#destroy'

  #GET a particular comment and show it
  #this needs to be below the new#comment
  get 'comments/:id' => 'comments#show', as: :comment

  #GET all of a users favorites and show them in index
  get '/favorites' => 'favorites#index', as: :favorites

  get '/favorites/new' => 'favorites#new', as: :new_favorite
  post '/favorites/create' => 'favorites#create', as: :create_favorite

  delete '/favorites' => 'favorites#destroy'

end
