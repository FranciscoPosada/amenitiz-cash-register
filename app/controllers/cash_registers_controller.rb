class CashRegistersController < ApplicationController
  before_action :set_cart

  def menu
    # The menu action shows links to other actions
  end

  def index
    @products = store_products
    @discounts = available_discounts # Add discounts to the index action
  end

  def add_item
    product_code = params[:product_code]
    @cart.add_item(product_code)
    save_cart_to_session
    redirect_to items_path, notice: "#{store_products[product_code][:name]} added to your cart."
  end

  def cart
    @store_products = store_products
    @pricing_rules = PricingRules.new(@store_products) # Make this an instance variable by adding '@'
    @total_price = @cart.total_price(@pricing_rules)
  end

  def checkout
    pricing_rules = PricingRules.new(store_products)
    @total = @cart.total_price(pricing_rules)
  end

  def remove_item
    product_code = params[:product_code]
    @cart.remove_item(product_code)
    save_cart_to_session
    redirect_to cart_path, notice: "#{store_products[product_code][:name]} removed from your cart."
  end

  def confirm_checkout
    session[:cart] = nil # Clear the cart
    redirect_to exit_path, notice: 'Thank you for your purchase!'
  end

  def exit
    session[:cart] = nil # Clear the cart on exit
  end

  private

  def store_products
    {
      "GR1" => { name: "Green Tea", price: 3.11 },
      "SR1" => { name: "Strawberries", price: 5.00 },
      "CF1" => { name: "Coffee", price: 11.23 }
    }
  end

  def available_discounts
    [
      "Buy-one-get-one-free on Green Tea",
      "Strawberries: 4.50€ each when you buy 3 or more",
      "Coffee: 2/3 price discount when you buy 3 or more"
    ]
  end

  def set_cart
    @cart = session[:cart] ? Cart.new(session[:cart]) : Cart.new
  end

  def save_cart_to_session
    session[:cart] = @cart.items
  end
end
