class OrdersController < ApplicationController
  before_action :set_product,  only: [:index, :create]

  def index
    @order = ProductTransaction.new
  end

  
  def create
    @order = ProductTransaction.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  def order_params
    params.require(:product_transaction).permit(:zip_code, :prefecture_id, :city, :address, :building, :phone_number, :order_id).merge(user_id: current_user.id, product_id: params[:product_id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end

