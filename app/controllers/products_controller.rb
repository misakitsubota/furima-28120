class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @products = Product.order("created_at DEBC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.valid?
      @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :product_name, :description, :cost, :product_category_id, :product_condition_id, :delivery_fee_id, :prefecture_id, :arrival_date_id).merge(user_id: current_user.id)
  end
end
