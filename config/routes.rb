Rails.application.routes.draw do

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
  get 'favorites/index' => 'favorites#index', as: :favorites

  get 'favorites/new' => 'favorites#new', as: :new_favorite
  post 'favorites/create' => 'favorites#create', as: :create_favorite

  delete 'favorites/:id' => 'favorites#destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  #send site visitors to the index page first
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
