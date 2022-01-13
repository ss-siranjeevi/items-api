3.times do |MUG|
	Item.create!(
        code: "MUG",
		name: "Reedsy Mug",
        price: 6,
        offer_id: 1
	)
end

3.times do |TSHIRT|
	Item.create!(
		code: "TSHIRT",
		name: "Reedsy T-shirt",
        price: 15,
        offer_id: 2
	)
end

3.times do |HOODIE|
	Item.create!(
		code: "HOODIE",
		name: "Reedsy Hoodie",
        price: 20,
        offer_id: 3
	)
end

Offer.create!(
    category: "BUY2GET1"
)

Offer.create!(
    category: "30%"
)

Offer.create!(
    category: "NOOFFER"
)