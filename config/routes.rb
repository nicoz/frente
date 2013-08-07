Frente::Application.routes.draw do
  match 'adherentes/search/' => 'adherentes#search', :as => :search_adherente
  match 'cuentas/search/' => 'cuentas#search', :as => :search_cuenta
  match 'localidads/search/' => 'localidads#search', :as => :search_localidad
  match 'comites/search/' => 'comites#search', :as => :search_comite
  match 'calles/search/' => 'calles#search', :as => :search_calle
  match 'calles/por_nombre' => 'calles#por_nombre', :as => :calles_por_nombre
  match 'calles/:localidad/por_localidad_y_nombre' => 'calles#por_localidad_y_nombre', :as => :calles_por_localidad_nombre
  match 'calles/:localidad/por_localidad_y_nombre_filtrado' => 'calles#por_localidad_y_nombre_filtrado', :as => :calles_por_localidad_nombre_filtrado
  match 'comites/:localidad/dar_comites/' => 'adherentes#dar_comites', :as => :comites_por_localidad
  match 'calles/:localidad/dar_calles/' => 'adherentes#dar_calles', :as => :calles_por_localidad

  match 'cuentas/generar' => 'cuentas#generar_mes', :as => :generar_mes
  match 'cuentas/confirmar_generacion_mes' => 'cuentas#confirmar_generacion_mes', :as => :confirmar_generacion_mes, :via => :POST

  match 'cuentas/:id/detalle' => 'cuentas#detalle', :as => :detalle_cuentas

  match 'informes/ver' => 'informes#index', :as => :ver_informes
  match 'informes/etareos' => 'informes#etareos', :as => :informe_etareo
  match 'informes/comites' => 'informes#comites', :as => :informe_comites

  match 'cuentas/pagar' => 'cuentas#pagar', :as => :pagar_cuentas, :via => :POST
  match 'cuentas/deber' => 'cuentas#deber', :as => :deber_cuentas, :via => :POST
  match 'cuentas/anular' => 'cuentas#anular', :as => :anular_cuentas, :via => :POST

  match 'cuentas/:anio/:mes/factura_mes' => 'cuentas#factura_mes', :as => :factura_mes
  match 'cuentas/:adherente/:anio/:mes/factura' => 'cuentas#factura', :as => :factura

  resources :adherentes

  resources :cuentas

  resources :localidads

  resources :comites

  resources :calles

  devise_for :users


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'escritorio#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
