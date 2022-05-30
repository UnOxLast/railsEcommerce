module ApplicationHelper
    # def data_currency(data)
    #   number_to_currency(data, unit: 'Rp. ', :precision => 0)
    # end

    # def current_cart
    #   if !session[:cart_id].nil?
    #       Cart.find(session[:cart_id])
    #   else
    #       Cart.new
    #   end
    # end



    # private
    # def current_cart
    #   if session[:cart_id]
    #     cart = Cart.find_by(:id => session[:cart_id])
    #     if cart.present?
    #       @current_cart = cart
    #     else
    #       session[:cart_id] = nil
    #     end
    #   end

    #   if session[:cart_id] == nil
    #     @current_cart = Cart.create
    #     session[:cart_id] = @current_cart.id
    #   end
    # end
end
