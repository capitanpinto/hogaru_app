class OrdersController < ApplicationController
  
  def index
    @user = current_user
    if @user.orders.last.present?
      if @user.orders.last.paid != true
       ordernum=@user.orders.last.id
       @services = @user.services.where("order_id = ?", ordernum)
      end
    else
      @services = []
    end
  end
  
  def create
    @order = current_user.orders.build
    if @order.save
      flash[:alert] = "You have created a new order!"
      redirect_to '\orders\index'
    else
      flash[:alert] = "Your request wasn't sent, try again!"
      redirect_to root_url
    end
  end
  
  def destroy 
  end
  
    private

    def order_params
      params.require(:user_id)
    end
end
