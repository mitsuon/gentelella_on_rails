Rails.application.routes.draw do
  get 'administracion_usuarios/index'

  get 'administracion_usuarios/activar/:id' => "administracion_usuarios#activar", as: :administracion_usuarios_activar
  get 'administracion_usuarios/bloquear/:id' => "administracion_usuarios#bloquear", as: :administracion_usuarios_bloquear
  match 'administracion_usuarios/:id' => 'administracion_usuarios#destroy', :via => :delete, :as => :administracion_usuarios_destroy_user

  devise_for :usuarios,:controllers =>{
    :registrations => "usuarios/registrations",
  }
  
  resources :modulos
  resources :mallas
  resources :carreras
  get 'carreras/index'
  get 'carreras/show'
  get 'carreras/new'
  get 'carreras/edit'
  get 'carreras/delete'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'plainpage#index'

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
