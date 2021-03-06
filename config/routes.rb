Rails.application.routes.draw do
  resources :harvesting_records

  resources :plantings

  resources :active_plants
  

  resources :active_plant_records

  resources :harvest_types

  resources :daily_records

  resources :soils

  resources :moon_phases

  resources :plant_statuses

  resources :plants


   #GET devise
   post 'locations/edit_multiple', :to => 'locations#edit_multiple', :as => 'locations_edit_multiple' 
  #get 'locations/edit_multiple', :to => 'locations#index', :as => 'locations' 

  put 'locations/update_multiple', :to =>  'locations#update_multiple', :as => 'locations_update_multiple' 
   
  resources :locations
  
  #
   


  resources :water_amounts

  root 'base#index'
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
