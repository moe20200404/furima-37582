class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(params_item)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def params_item
    params.require(:item).permit(
      :image, :name, :info, :category_id, :status_id, :shopping_fee_status_id,
      :prefecture_id, :scheduled_delivery_id, :price, :user
    ).merge(user_id: current_user.id)
  end
end
