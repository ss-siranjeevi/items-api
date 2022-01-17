class Offer < ApplicationRecord

  enum type: ['BUY2GET1', '30%', 'NOOFFER']

  def self.get_price(type, price, no_quantity)
    case type
    when 'BUY2GET1'
      ((no_quantity / 3) * (price * 2)) + ((no_quantity / 3) * price)
    when '30%'
      return price - (price * 30) / 100 if no_quantity >= 3

      price
    else
      price
    end
  end
end
