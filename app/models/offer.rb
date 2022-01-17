class Offer < ApplicationRecord
  
  def self.get_price(offer_type, price, num_quantity)
    case offer_type
    when 'BUY2GET1'
      (((num_quantity / 3) * (price * 2)) + ((num_quantity % 3) * price)).to_i
    when '30%'
      return ((price*num_quantity) - ((price*num_quantity) * 30) / 100) if num_quantity >= 3

      price
    else
      price
    end
  end
end
