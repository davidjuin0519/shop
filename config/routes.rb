Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get 'home/newest'
  get 'home/hotest'

  namespace :admin do
    resources :roles
    resources :users do
      post :change
    end
    resources :faqs
    resources :bugs
    resources :member_questions do
      resources :answers
    end
    resources :catalogs do
      resources :subclasses do
        get :product
        post :klassify
      end
    end
    resources :products do
      resources :inventories do
        resources :inventory_images
      end
    end
  end

  resources :catalogs do
    resources :subclasses
  end
  
  resources :carts do
    member do
      post :operation
      post :remove
      put :add
    end
  end
  resources :products
  resources :orders 
  resources :member_questions do
    resources :answers
  end
  resources :bugs
  resources :faqs
  resources :contacts

  devise_for :users, :controllers => { :registrations => "my_devise/registrations" }
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
