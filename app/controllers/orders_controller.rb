class OrdersController < ApplicationController
  def index
  end
  
  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      flash[:alert] = "You have created a new order!"
      redirect_to 'orders/index'
    else
      flash[:alert] = "Your request wasn't sent, try again!"
      redirect_to root_url
    end
  end
  
  def destroy 
  end
  
    private

    def order_params
      params.require(:order).permit(:user_id)
    end
end
