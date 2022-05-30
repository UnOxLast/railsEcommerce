class HomeController < ApplicationController
  def index
    @products = Product.all
    @cart = @current_cart
    
  end
 
  def about
  end
  def dashboard
    @products = Product.filter_search(params[:name_search], params[:type_select], params[:brand_select])
  end

  # def cart
  #   quantity = params[:quantity].to_i
  #   product_id = params[:product]
  #   @product = Product.find(product_id)
  #   @cart.add(@product, @product.price_product, quantity)
  #   redirect_to  request.referer || "/"
  #   flash[:notice] = "#{@product.name} has been added to the Cart."
  # end

  # def create_order
  #   total_price_delivery = 0
  #   total_price_items = @cart.total_items
  #   total_all_price = total_price_delivery + total_price_items
  
  #   @order = Order.new
  #   @order.number = "#{current_user.id}-#{Time.now.to_i}"
  #   @order.user_id = current_user.id
  #   @order.total_price_items = total_price_items
  #   @order.total_price_delivery = total_price_delivery
  #   @order.total_all_price = total_all_price
  #   @order.save
  #   @cart.update(:order_id => @order.id)
  #   redirect_to root_path
  #   flash[:notice] = "Your Order has been created"
  # end
  




  def cover_url 
    rails_blob_path(self.image_product, disposition: "attachment", only_path: true)
  end

  def persisted?
    false
  end

end