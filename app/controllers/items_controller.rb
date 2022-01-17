class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    item = Item.find(params[:id])
    render json: { status: 'Success', message: 'Item found', item: item }
  end

  def create
    item = Item.new(item_params)
    item.save!
    render json: { status: 'Success', message: 'Item created', item: item }
  end

  def update
    item = Item.find(params[:id])
    item.update!(item_params)
    render json: { status: 'Success', message: 'Item updated', item: item }
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy!
    render json: { status: 'Success', message: 'Item deleted' }
  end

  def place_order
   total_price = PlaceOrderService.new(params[:item]).call
   render json: { status: 'Success', message: 'Item deleted', total_price: total_price }
  end

  private

  def item_params
    params.require(:item).permit(:code, :name, :price)
  end
end
