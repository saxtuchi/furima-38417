class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.order.present?
      redirect_to root_path
    else
      @order = OrderForm.new
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderForm.new(order_params)
    if @order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
