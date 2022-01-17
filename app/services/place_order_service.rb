class PlaceOrderService
  def initialize(items, is_offer=false)
    @items = items
    @is_offer = is_offer
  end

  def call
    if @is_offer
    grouped_items = group_by_item_code
    get_total_price_with_offer(grouped_items) 
    else
    get_total_price(@items) 
    end
  end

  def group_by_item_code
   
    h1 = {}
    @items.group_by { |item| item[:code] }.each do |key, items|
      h2 = {}
      sum = 0
      items.each do |item|
        # sum += item[:price].to_i
        h2.store(key, { name: item[:name], quantity: items.length, price: item.price.to_i, offer_type: Offer.find_by(id: item[:offer_id]).category })
      end
      h1.merge!(h2)
    end
    h1
  end

  def get_total_price_with_offer(items)
    total_price = 0
    items.each do |key, value|
      total_price += Offer.get_price(value[:offer_type], value[:price], value[:quantity])
    end
    total_price
  end

  def get_total_price(items)
    items.reduce(0) do |total_price,item|
      total_price += item[:price] 
    end
  end
end
