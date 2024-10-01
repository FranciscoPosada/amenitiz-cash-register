class Cart
  attr_reader :items

  def initialize(items = {})
    @items = items
  end

  def add_item(product_code)
    @items[product_code] ||= 0
    @items[product_code] += 1
  end

  def remove_item(product_code)
    return unless @items[product_code]

    @items[product_code] -= 1
    @items.delete(product_code) if @items[product_code] <= 0
  end

  def total_price(pricing_rules)
    total = 0
    @items.each do |product_code, quantity|
      total += pricing_rules.apply(product_code, quantity)
    end
    total
  end
end
