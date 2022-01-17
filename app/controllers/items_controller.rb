class ItemsController < ApplicationController

  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id 
    redirect_to items_path
  end  

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to items_path
  end

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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update!(item_params)
    redirect_to items_path
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy!
    render json: { status: 'Success', message: 'Item deleted' }
  end

  def place_order
    @total_price = PlaceOrderService.new(@cart).call
  end

  def place_order_with_offer
   @total_price = PlaceOrderService.new(@cart, true).call
  end

  private

  def item_params
    params.require(:item).permit(:code, :name, :price)
  end
end
