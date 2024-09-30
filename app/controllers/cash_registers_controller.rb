class CashRegistersController < ApplicationController
  before_action :set_cart

  def index
    @products = store_products
  end

  def add_item
    @cart.add_item(params[:product_code])
    redirect_to cart_path
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
    @cart = Cart.new  # Replace with session-based cart persistence later
  end
end
