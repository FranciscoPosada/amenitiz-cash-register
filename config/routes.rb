Rails.application.routes.draw do
  root 'cash_registers#menu'
  get 'items', to: 'cash_registers#index'
  get 'discounts', to: 'cash_registers#discounts'
  get 'cart', to: 'cash_registers#cart'
  get 'checkout', to: 'cash_registers#checkout'
  post 'add_item', to: 'cash_registers#add_item', as: 'add_item'
  get '/exit', to: 'cash_registers#exit', as: 'exit'
  post '/remove_item', to: 'cash_registers#remove_item', as: 'remove_item'
  post '/confirm_checkout', to: 'cash_registers#confirm_checkout', as: 'confirm_checkout' # Add this route
end
