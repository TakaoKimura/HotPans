HotPans::Application.routes.draw do
  get "bread_store_managers/index"
  get "bread_store_managers" => 'bread_store_managers#index'
  get "authentications/create"
  get '/auth/:provider/callback' => 'authentications#create'
  devise_for :bread_store_managers

  get '/breads/yakiagari_breads', to: 'breads#yakiagari_breads', as: 'yakiagari_breads'
  get '/breads/:id/start_yakiagari', to: 'breads#start_yakiagari', as: 'start_yakiagari_bread'
  get '/breads/:id/end_yakiagari', to: 'breads#end_yakiagari', as: 'end_yakiagari_bread'

  post '/breads/:id/edit', to: 'breads#edit', as: 'edit_back_bread'
  post '/breads/new', to: 'breads#new', as: 'new_back_bread'
  post '/breads/:id/edit_confirm', to: 'breads#edit_confirm', as: 'edit_confirm_bread'
  post '/breads/confirm', to: 'breads#confirm', as: 'confirm_bread'

  resources :breads

  post '/bread_stores/:id/edit', to: 'bread_stores#edit', as: "edit_back_bread_store"
  post '/bread_stores/new', to: 'bread_stores#new', as: 'new_back_bread_store'

  post '/bread_stores/:id/edit_confirm', to: 'bread_stores#edit_confirm', as: 'edit_confirm_bread_store'
  post '/bread_stores/confirm', to: 'bread_stores#confirm', as: 'confirm_bread_store'
  
  resources :bread_stores

  # get '/bread_stores/confirm', to: 'bread_stores#confirm', as: 'confirm_bread_store'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
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
