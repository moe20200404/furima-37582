class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new
  end
  def create
    @order_delivery = OrderDelivery.new(params_order)
    @item = Item.find(params[:item_id])
    if @order_delivery.valid?
      pay_item
      @order_delivery.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

private
  def params_order
    params.require(:order_delivery).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params_order[:token],
      currency: 'jpy'
    )
  end
end
