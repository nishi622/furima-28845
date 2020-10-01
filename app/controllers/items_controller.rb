class ItemsController < ApplicationController
  before_action :move_to_index, except: %i[index show]
  before_action :set_item, only: [:show, :edit]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :delivery_fee_id, :delivery_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
