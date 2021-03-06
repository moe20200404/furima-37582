class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :orderd_item, only: [:edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
    @orderd_item = Order.pluck(:item_id)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params_item)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @orderd_item = Order.pluck(:item_id)
  end

  def edit
    redirect_to root_path if @item.user != current_user
  end

  def update
    if @item.update(params_item)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.user == current_user
      @item.destroy
      redirect_to root_path
    else
      redirect_to item_path
    end
  end

  private

  def params_item
    params.require(:item).permit(
      :image, :name, :info, :category_id, :status_id, :shopping_fee_status_id,
      :prefecture_id, :scheduled_delivery_id, :price
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def orderd_item
    @orderd_item = Order.pluck(:item_id)
    redirect_to root_path if @orderd_item.include?(@item.id)
  end
end
