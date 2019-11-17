class OrdersController < ApplicationController
  before_action :admin_user,     only: [:index, :destroy]
  
  def show
    @order=current_user.orders.last
    @price= @order.services.count * 50000
  end
  
  def index
    @orders=Order.all
  end

  def create
    @order = current_user.orders.build
    if @order.save
      flash[:alert] = "You have created a new order!"
      redirect_to services_path
    else
      flash[:alert] = "Your request wasn't sent, try again!"
      redirect_to root_url
    end
  end
  
  def destroy 
  end
  
    private
    
    def admin_user
      redirect_to(root_url) unless admin_signed_in?
    end

    def order_params
      params.require(:user_id)
    end
end
