Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #


  root 'order#new'
  resources :order

  get '/reports/' , to: 'order#reports'
  post '/bulk_order', to: 'order#bulk_order'
  delete '/delete_all_orders', to: 'order#delete_all_orders'


end
