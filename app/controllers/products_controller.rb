require 'product_datatable'

class ProductsController < ApplicationController
  def index
    @products = Product.all
    @countries = @products.pluck(:country).uniq
    respond_to do |format|
      format.html
      format.json { render json: ProductsDatatable.new(view_context) }
    end
  end

  def show

  end
end
