require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:store) do
    {
      "GR1" => { name: "Green Tea", price: 3.11 },
      "SR1" => { name: "Strawberries", price: 5.00 },
      "CF1" => { name: "Coffee", price: 11.23 }
    }
  end

  let(:pricing_rules) { PricingRules.new(store) }
  let(:cart) { Cart.new }

  it "adds items to the cart" do
    cart.add_item("GR1")
    expect(cart.items["GR1"]).to eq(1)
  end

  it "removes items from the cart" do
    cart.add_item("GR1")
    cart.remove_item("GR1")
    expect(cart.items["GR1"]).to be_nil
  end

  it "calculates total price with no discounts" do
    cart.add_item("CF1")
    cart.add_item("SR1")
    expect(cart.total_price(pricing_rules)).to eq(16.23)
  end

  it "applies buy-one-get-one-free discount on Green Tea" do
    cart.add_item("GR1")
    cart.add_item("GR1")
    expect(cart.total_price(pricing_rules)).to eq(3.11)
  end
end
