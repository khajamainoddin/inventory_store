Rails.application.routes.draw do

#   get 'admin' => 'admin#index'

# controller :sessions do
#   get 'login' => :new
#   post 'login' => :create
#   delete 'logout' => :destroy

# end

 get 'products_import/new'

  resources :products_import
  resources :products do
    collection { post :import }
  end
  
 # resources :users
  resources :orders
  resources :line_items
  resources :carts

  root 'products#index'
  
 
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
