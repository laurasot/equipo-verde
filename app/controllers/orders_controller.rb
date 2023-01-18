class OrdersController < ApplicationController
  before_action :set_order, only: [:show]
  #skip_before_action :authenticate_user!, only: [ :show]

  def new
    if params[:product_id]
      @product = Product.find(params[:product_id])
    else
      @product.first
    end
    @order = Order.new
  end

  def create

    @product = Product.find(params[:order][:product_id])
    @order   = Order.new(order_params)
    @order.user = current_user
    if user_signed_in?
      if @order.save!
        LineItem.create!(
          order: @order,
          product: @product,
          amount: 1,
          total_price: @product.price
        )

        @order.update(total_price: @product.price)
        redirect_to @order
      else
        render :new, params: { product_id: @product.id }
      end
    else
      #flash.now[:notice] = 'Message sent!'
      flash.now[:alert] = 'Debe registrarse para completar la orden!'


      render :new, params: { product_id: @product.id }
    end
  end


  def show
    @order = Order.find(params[:id])
  end

  def update
  end

  private

  def order_params
    params.require(:order).permit(:name, :description, :status)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
