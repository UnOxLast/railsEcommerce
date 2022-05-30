class ApplicationController < ActionController::Base
  # Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

    
  # Cart Method
  protect_from_forgery with: :exception
  before_action :current_cart
  


  private
  def current_cart
    # if user_signed_in?
    #   user = Cart.find_by(user_id: current_user.id)
    # end
    if session[:cart_id]
      cart = Cart.find_by(:id => session[:cart_id])
      if cart.present?
        @current_cart = cart
      else
        session[:cart_id] = nil
      end
    end
    if session[:cart_id] == nil
        # if user == nil
        #   @current_cart = Cart.create(user_id: current_user.id)
        #   session[:cart_id] = @current_cart.user_id
        # else
        # end
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end
  end
end
