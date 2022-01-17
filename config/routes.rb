Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :items
  post 'items/place_order', to: 'items#place_order'
  post 'items/place_order_with_offer', to:'items#place_order_with_offer'
  post "items/add_to_cart/:id", to: "items#add_to_cart", as:"add_to_cart"
  delete "items/remove_from_cart/:id", to: "items#remove_from_cart", as:"remove_from_cart"
  post "items/add_items/:id", to: "items#add_items", as: "add_items"
end
