# This is product controller
class ProductsController < ApplicationController
  def index 
    # (with_attached_photo) para eliminar el problema de n + 1 query
    # (with_attached_photo) --> evita hacer consultas adicionales
    @categories = Category.order(name: :asc).load_async
    @products = Product.order(created_at: :desc).with_attached_photo.load_async
    @products = @products.where(category_id: params[:category_id]) if params[:category_id]
    @products = @products.where('price >= ?', params[:min_price]) if params[:min_price].present?
    @products = @products.where('price <= ?', params[:max_price]) if params[:max_price].present?
  end

  def show
    product
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: t('.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    product
  end

  def update
    if product.update(product_params)
      redirect_to products_path, notice: t('.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    product.destroy
    redirect_to products_path, notice: t('.destroyed'), status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :photo, :category_id)
  end

  def product
    @product = Product.find(params[:id])
  end
end
