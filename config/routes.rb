Rails.application.routes.draw do
  resources :movies do
    collection do
      match 'search' => 'movies#search', via: [:get, :post], as: :search
      match 'list' => 'movies#list', via: [:get]
      match 'update_search' => 'movies#update_search', via: [:post]
      match 'clear_search' => 'movies#clear_search', via: [:post]
      match 'left_column' => 'movies#left_column', via: [:get]
    end
  end

#  resources :mpaas
  resources :frames
  resources :covers
#  resources :countries
#  resources :translations
#  resources :rubrics
#  resources :flavors
#  resources :genres

#  devise_for :users, ActiveAdmin::Devise.config
  devise_for :users

  begin
    ActiveAdmin.routes(self)
  rescue Exception => e
    puts "ActiveAdmin: #{e.class}: #{e}"
  end


  root to: 'movies#index'

  get 'countries' => 'countries#index'
  get 'genres' => 'genres#index'

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
end
