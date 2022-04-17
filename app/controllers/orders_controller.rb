class OrdersController < ApplicationController
  def index
    @order_delivery = OrderDelivery.new
  end
  def create
  end
end
