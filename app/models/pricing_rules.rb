class PricingRules
  def initialize(store)
    @store = store
  end

  def apply(item_code, quantity)
    item_price = @store[item_code][:price]

    if item_code == "GR1"
      free_items = quantity / 2
      paid_items = quantity - free_items
      paid_items * item_price
    elsif item_code == "SR1"
      if quantity >= 3
        quantity * 4.50
      else
        quantity * item_price
      end
    elsif item_code == "CF1"
      if quantity >= 3
        discounted_price = item_price * (2.0 / 3.0)
        quantity * discounted_price
      else
        quantity * item_price
      end
    else
      quantity * item_price
    end
  end
end
