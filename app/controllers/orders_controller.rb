class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new
  end
  def create
    @order_delivery = OrderDelivery.new(params_order)
    if @order_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

private
  def params_order
    params.require(:order_delivery).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :item_id).merge(user_id: current_user.id)
  end
end
