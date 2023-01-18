class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    #if Order.exists?(user_id: current_user)
    # @order = Order.find(user_id: current_user)
    #else
    # @order = Order.new
    #end
    #@line_item = Line_item.new
    @category = Category.find(params[:id])
    @products = Product.where(category_id: @category.id)
  end

  private

  def category_params
    params.require(:category).permit(:name, :description, :price, :image_url)
  end

end
