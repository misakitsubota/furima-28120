class OrdersController < ApplicationController
  def index
  end
  
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to action: :index
    else
      render action: :new
    end
  end
  
  private
  def order_params
    params.requre(:order).permit(:user_id, :product_id, :zip_code, :prefecture_id, :city, :address, :building, :phone_number, :buyer_id)
  end
end
