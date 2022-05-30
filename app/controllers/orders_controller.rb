class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def toggle_confirm
    @order = Order.find(params[:id])  
    @order.toggle!(:confirmed)  
    redirect_to orders_url 
  end

  def create
    @order = Order.create(order_params)
    # @order.add_line_items_from_cart(@cart)
    # @current_cart.line_items.each do |item|
    #   item.cart_id = nil
    #   @order.line_items << item
    # end

    # @order.save
    # Cart.destroy(session[:cart_id])
    # session[:cart_id] = nil
    # @order.save
    if @order.save # this will save the order 
       
      @current_cart.line_items.each do |line_item|
         # using the bang (!) to save to the DB and raise any errors
         # rather than failing silently
         @order.order_items.create!(         
            product_id: line_item.product_id,
            quantity:   line_item.quantity 
         )
         line_item.cart_id = nil
      end
      
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil

       redirect_to @order, notice: 'Order was successfully created.'
    else
       redirect_to root_path, notice: 'Something went wrong saving the order.'
    end 

    # respond_to do |format|
    #   if @order.save
    #     format.html { redirect_to @order, notice: 'Order was successfully created.' }
    #     format.json { render :show, status: :created, location: @order }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @order.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully Done.' }
      format.json { head :no_content }
    end
  end


  
  private
  def order_params
    params.require(:order).permit(:name, :email, :address, :pay_method)
  end
end
