class ItemsController < ApplicationController
        def index
            @items = Item.all
            render json: { status: 'Success', message: 'Presented items', items: @items }, status: :ok
        end

        def show
            item = Item.find(params[:id])
            render json: { status: 'Success', message: 'Item found', item: item }, status: 302
        end

        def create
            item = Item.new(item_params)
            item.save!
            render json: { status: 'Success', message: 'Item created', item: item }, status: 201
        end

        def update
            item = Item.find(params[:id])
            item.update!(item_params)
            render json: { status: 'Success', message: 'Item updated', item: item }, status: :ok
        end

        def destroy
            item = Item.find(params[:id])
            item.destroy!
            render json: { status: 'Success', message: 'Item deleted' }, status: :ok
        end


        private

        def item_params
            params.require(:item).permit(:code, :name, :price)
        end

end

