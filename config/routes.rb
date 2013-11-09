Opencv::Application.routes.draw do
  PagesController.action_methods.each do |action|
    get "/#{action}", to: "pages##{action}", as: "#{action}_page"
  end
  devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => 'users/sessions', :passwords => "users/passwords"}

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  resources :experiences
  resources :skills
  resources :hobbies
  resources :educations
  resources :contact_types
  post 'contact_types/index' => 'contact_types#batch_create'
  get "cards/:ignored" => "card#show"
  put "cards/:ignored" => "card#update"
  get 'cards' => 'card#show'
  resources :languages

  root :to => 'home#index', as: "authenticated_root"
  get '/landing' => "home#landing"
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  get '/show' => "home#show"
  post '/uploads' => 'uploads#create'
end
