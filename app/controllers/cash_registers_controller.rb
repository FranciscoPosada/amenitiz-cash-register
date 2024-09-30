class CashRegistersController < ApplicationController
  before_action :set_cart

  def menu
    # The menu action shows links to other actions
  end

  def index
    @products = store_products
  end

  def add_item
    product_code = params[:product_code]
    @cart.add_item(product_code)
    save_cart_to_session
    redirect_to cart_path
  end

  def cart
    @store_products = store_products
  end

  def checkout
    pricing_rules = PricingRules.new(store_products)
    @total = @cart.total_price(pricing_rules)
  end

  private

  def store_products
    {
      "GR1" => { name: "Green Tea", price: 3.11 },
      "SR1" => { name: "Strawberries", price: 5.00 },
      "CF1" => { name: "Coffee", price: 11.23 }
    }
  end

  def set_cart
    @cart = session[:cart] ? Cart.new(session[:cart]) : Cart.new
  end

  def save_cart_to_session
    session[:cart] = @cart.items
  end
end
