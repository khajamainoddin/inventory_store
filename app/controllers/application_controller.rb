class ApplicationController < ActionController::Base
 # before_action :authorize

  protect_from_forgery with: :exception
  
  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
  # protected

  # def authorize
  # 	unless User.find_by(id: session[:user_id])
  # 		redirect_to login_path, notice: "Please log in"
  # 	end
  # end
end
