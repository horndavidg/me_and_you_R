Rails.application.routes.draw do
  
  root "sessions#landing"

  

match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
match 'auth/failure', to: redirect('/'), via: [:get, :post]
match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]


  get 'login', to: "sessions#login", as: "login"
  get 'signup', to: "sessions#signup", as: "signup"
  post 'login', to: "sessions#attempt_login"
  delete 'logout', to: "sessions#logout", as: "logout"
  post 'match/:id', to: "users#match", as: "match"
  post 'matched/:id', to: "users#add_match", as: "add_match"
  delete 'match/:id', to: "users#no_match", as: "no_match"
  delete 'matched/:id', to: "users#remove_match", as: "remove_match"
  

  resources :resets, only: [:new, :edit, :create, :update]

  resources :users, except: [:new]

  resources :kudos, except: [:show, :edit, :update]

  resources :coupons, except: [:show, :edit, :update]

  get 'buy-coupon/:id', to: "coupons#buy", as:"buy_coupon"
  delete 'redeem-coupon/:id', to: "coupons#redeem", as:"redeem_coupon"


end
# --------------------------------------------------

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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