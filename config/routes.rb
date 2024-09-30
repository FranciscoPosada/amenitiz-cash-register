Rails.application.routes.draw do
  root 'cash_registers#index'

  post 'add_item', to: 'cash_registers#add_item', as: 'add_item'
  get 'cart', to: 'cash_registers#cart', as: 'cart'
  get 'checkout', to: 'cash_registers#checkout', as: 'checkout'
end
