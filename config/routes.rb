Rails.application.routes.draw do
  root 'cash_registers#menu'
  get 'items', to: 'cash_registers#index'
  get 'discounts', to: 'cash_registers#discounts'
  get 'cart', to: 'cash_registers#cart'
  get 'checkout', to: 'cash_registers#checkout'
  post 'add_item', to: 'cash_registers#add_item', as: 'add_item'
  get '/exit', to: 'cash_registers#exit', as: 'exit'
end
