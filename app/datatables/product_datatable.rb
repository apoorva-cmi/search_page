class ProductsDatatable < ApplicationDatatable
    # delegate :edit_product_path, to: :@view
  
    private
  
    def data
      products.map do |product|
        [].tap do |column|
          column << product.title
          column << product.description
          column << product.country
          column << product.tags
          column << product.price
        end
      end
    end
  
    def count
      Product.count
    end
  
    def total_entries
      return 0 if products.blank?
      products.total_count
    end
  
    def products
      @products ||= fetch_products
    end
  
    def fetch_products
      search_string = []
      columns.each do |term|
        search_string << "#{term} like :search"
      end
  
      products = Product.order("#{sort_column} #{sort_direction}")
      products = products.page(page).per(per_page)
      products = products.where(search_string.join(' or '), search: "%#{params[:search][:value]}%")
    end
  
    def columns
      %w(title description country tags price)
    end
  end