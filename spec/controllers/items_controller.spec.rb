require 'rails_helper'

describe 'ItemsController', type: :request do

  describe 'create' do
    let(:params) { { item: { code: 'TSHIRT', name: 'Roadster', price: 6 } } }
    it 'creates Item successfully' do
      expect do
        post '/items', params: params
      end.to change { Item.count }.by(1)
      expect(response.status).to eq 200
      expect(Item.last.code.present?).to be true
    end
  end

  describe 'show' do
    let!(:new_item) { Item.create({ code: 'TSHIRT', name: 'Roadster', price: 6 }) }
    it 'items successfully' do
      get "/items/#{new_item.id}", params: {}, headers: { 'ACCEPT' => 'application/json' }
      item = JSON.parse(response.body)['item']
      expect(response.status).to eq 200
      expect(item['price']).not_to be_nil
    end
  end

  describe 'update' do
    let(:new_item) { Item.create!({ code: 'TSHIRT', name: 'Roadster', price: 6 }) }
    let(:params) { { item: { code: 'TSHIRT', name: 'Roadster', price: 9 } } }
    it 'updated successfully' do
      put "/items/#{new_item.id}", params: params
      expect(response).to redirect_to(items_path)
    end
  end

  describe 'destroy' do
    let!(:new_item) { Item.create!({ code: 'TSHIRT', name: 'Roadster', price: 6 }) }
    it 'delete item successfully' do
      expect do
        delete "/items/#{new_item.id}", params: {}, headers: { 'ACCEPT' => 'application/json' }
      end.to change { Item.count }.by(-1)
    end
  end

  describe 'place_order_with_order' do
    let(:new_item1) { Item.create!({ code: 'TSHIRT', name: 'Roadster', price: 15, offer_id: 2 }) }
    let(:new_item2) { Item.create!({ code: 'TSHIRT', name: 'Roadster', price: 15, offer_id: 2 }) }
    let(:new_item3) { Item.create!({ code: 'TSHIRT', name: 'Roadster', price: 15, offer_id: 2 }) }
    let(:new_item4) { Item.create!({ code: 'TSHIRT', name: 'Roadster', price: 15, offer_id: 2 }) }
    let(:new_item5) { Item.create!({ code: 'MUG', name: 'Mast Harb', price: 6, offer_id: 1 }) }
    let(:new_item6) { Item.create!({ code: 'MUG', name: 'Mast Harb', price: 6, offer_id: 1 }) }
    let(:new_item7) { Item.create!({ code: 'HOODIE', name: 'Super Dry', price: 20, offer_id: 3 }) }
    let(:params) { { items: [new_item1, new_item2, new_item3, new_item4, new_item5,new_item6, new_item7 ]  } }
    it 'successfully place the order' do
      get 'items/place_order_with_order', params: params
      order = JSON.parse(response.body)['order']
      expect(response.status).to_eq 200
      expect(order['price']).to 74
    end
  end

end
