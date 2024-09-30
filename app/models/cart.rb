class Cart
  attr_reader :items

  def initialize
    @items = Hash.new(0)
  end

  def add_item(product_code)
    @items[product_code] += 1
  end

  def total_price(pricing_rules)
    total = 0
    @items.each do |item_code, quantity|
      total += pricing_rules.apply(item_code, quantity)
    end
    total
  end
end
