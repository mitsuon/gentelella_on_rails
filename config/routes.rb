Rails.application.routes.draw do
  resources :presupuestos
  resources :solicitar_seccions do
    collection do
      get 'index'
    end
  end
  resources :seccions do
    collection do
      get 'solicitud'
      get 'mis_solicitudes'
      
    end
  end
  resources :profesors do
  collection do
    get 'new1'
    get 'honorario'
    get 'tiempo_completo'
  end
end
  
  get 'administracion_usuarios/index'
  get 'seccions/index2'
  get 'administracion_usuarios/activar/:id' => "administracion_usuarios#activar", as: :administracion_usuarios_activar
  get 'administracion_usuarios/bloquear/:id' => "administracion_usuarios#bloquear", as: :administracion_usuarios_bloquear
  match 'administracion_usuarios/:id' => 'administracion_usuarios#destroy', :via => :delete, :as => :administracion_usuarios_destroy_user

  get 'solicitar_seccions/index/aceptar/:id' => "solicitar_seccions#aceptar", as: :solicitar_seccions_activar
  get 'solicitar_seccions/index/rechazar/:id' => "solicitar_seccions#rechazar", as: :solicitar_seccions_rechazar
  match 'solicitar_seccions/index/:id' => "solicitar_seccions#destroy", :via => :delete, :as => :solicitar_seccions_destroy_solicitud
  
  get 'modulos/editar_espejo/:id' => "modulos#editar_espejo", as: :editar_espejo_modulos

  get 'modulos/agregar_espejo/:id/:espejo' => "modulos#agregar_espejo", as: :agregar_espejo
  get 'modulos/eliminar_espejo/:id/:espejo' => "modulos#eliminar_espejo", as: :eliminar_espejo


  post 'solicitar_seccions/index' => "solicitar_seccions#create"
  
  
  get 'asignar/profesor/:profesor_id/semestre/:semestre/anio/:anio' => "profesors#asignar" , as: :asignar
  get 'visualizar_honorario/profesor/:profesor_id/semestre/:semestre/anio/:anio' => "profesors#visualizar_honorario" , as: :visualizar_honorario
  get 'contrato/profesor/:profesor_id/semestre/:semestre/anio/:anio' => "profesors#contrato" , as: :profesor_contrato

  
  post 'asignar' => "profesors#guardar_asignar", as: :guardar_asignar
  post 'quitar' => "profesors#quitar_asignar", as: :quitar_asignar

  post 'visualizar_honorario' => "profesors#guardar_visualizar_honorario", as: :guardar_visualizar_honorario
  
  
  get 'tiempo_completo/asignar/profesor/:profesor_id/semestre/:semestre/anio/:anio' => "profesors#tiempo_completo_asignar" , as: :tiempo_completo_asignar
  get 'tiempo_completo/visualizar/profesor/:profesor_id/semestre/:semestre/anio/:anio' => "profesors#tiempo_completo_visualizar" , as: :tiempo_completo_visualizar
  
  post 'tiempo_completo/asignar' => "profesors#guardar_tiempo_completo_asignar", as: :guardar_tiempo_completo_asignar
  post 'tiempo_completo/visualizar_honorario' => "profesors#guardar_tiempo_completo_visualizar", as: :guardar_tiempo_completo_visualizar
  
  
  

  devise_for :usuarios,:controllers =>{
    :registrations => "usuarios/registrations",
  }
  
  resources :administracion_usuarios
  resources :modulos 
  resources :mallas
  resources :carreras
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
