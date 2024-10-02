require 'rails_helper'

RSpec.describe PricingRules, type: :model do
  let(:store) do
    {
      "GR1" => { name: "Green Tea", price: 3.11 },
      "SR1" => { name: "Strawberries", price: 5.00 },
      "CF1" => { name: "Coffee", price: 11.23 }
    }
  end

  let(:pricing_rules) { PricingRules.new(store) }

  it "applies buy-one-get-one-free discount for Green Tea" do
    expect(pricing_rules.apply("GR1", 2)).to eq(3.11)
  end

  it "applies bulk discount for Strawberries when buying 3 or more" do
    expect(pricing_rules.apply("SR1", 3)).to eq(13.50)
  end

  it "applies coffee discount for 3 or more" do
    expect(pricing_rules.apply("CF1", 3)).to eq(22.46)
  end
end
