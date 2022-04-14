class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @items = Item.order('created_at DESC')
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user != current_user
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(params_item)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def params_item
    params.require(:item).permit(
      :image, :name, :info, :category_id, :status_id, :shopping_fee_status_id,
      :prefecture_id, :scheduled_delivery_id, :price
    ).merge(user_id: current_user.id)
  end
end
