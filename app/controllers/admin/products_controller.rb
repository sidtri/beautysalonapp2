class Admin::ProductsController < ApplicationController
  add_breadcrumb "dashboard", :admin_path
  add_breadcrumb "producten", :admin_products_path
  def index
    @products = Product.order_by_position
  end

  def show
    @product = Product.find(params[:id])
    add_breadcrumb @product.title
  end

  def new
    add_breadcrumb "product toevoegen"
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to admin_products_path, notice: "Er werd een nieuw product toegevoegd"
    else
      flash[:alert] = @product.errors.full_messages.join(' ')
      render :new
    end
  end

  def edit
    add_breadcrumb "product aanpassen"
    @product = Product.find(params[:id])  
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to admin_products_path, notice: "Het product \"#{@product.title}\" werd aangepast"
    else
      flash[:alert] = @product.errors.full_messages.join(' ')
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to admin_products_path, notice: "Het product werd verwijderd" 
  end

  def sort
    params[:product].each_with_index do |id, index|
      Product.where(id: id).update_all({position: index+1})
    end
    render nothing: true
  end

  private

  def product_params
    params.required(:product).permit(:title, :description, :image, :remove_image)
  end
end
