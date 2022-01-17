class PlaceOrderService
  def initialize(items)
    @items = items
  end

  def call
    grouped_items = group_by_item_code
    get_total_price(grouped_items)
  end

  def group_by_item_code
    h1 = []
    @items.group_by { |item| item[:code] }.each do |key, items|
      h2 = {}
      sum = 0
      items.each do |item|
        sum += item[:price]
        h2.store(key, { name: item[:name], quantity: items.length, price: sum, offer_type: Offer.find_by(id: items[:offer_id]) })
      end
      h1.merge!(h2)
    end
  end

  def get_total_price(items)
    total_price = 0
    items.each do |item|
      total_price += Offer.get_price(item.offer_type, item.quantity)
    end
    total_price
  end
end
