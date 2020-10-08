class OrdersController < ApplicationController
  
  before_action :set_item, only: [:index, :create]
  def index
    @order = OrderAddress.new
  end



  def create
    @order = OrderAddress.new(order_params)
    # binding.pry
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  

  private

  def order_params
    params.require(:order_address).permit( :postal_code, :prefecture_id, :city, :banti, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
