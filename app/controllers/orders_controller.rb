class OrdersController < ApplicationController
  before_action :set_product,  only: [:index]

  def index
    @order = ProductTransaction.new
  end
  
  def create
    binding.pry
    @order = ProductTransaction.new(order_params)
    if @order.valid?
      @order.save
      redirect_to action: :index
    else
      redirect_to product_orders_path
    end
  end
  
  private
  def order_params
    params.require(:product_transaction).permit(:zip_code, :prefecture_id, :city, :address, :building, :phone_number, :order_id).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end

def set_product
  @product = Product.find(params[:product_id])
end
