class ServicesController < ApplicationController
  
  def home
    @order = current_user.orders.build if user_signed_in?
  end
  
  def create
    @service = current_user.services.build(service_params)
    if current_user.orders.last.present?
    ordernumber=current_user.orders.last.id 
    @service.update(order_id: ordernumber)
    end
    if @service.save
      flash[:alert] = "You have requested a service!"
      redirect_to '\orders\index'
    else
      flash[:alert] = "Your request wasn't sent, try again!"
      redirect_to '\orders\index'
    end
  end
  
  
  private

    def service_params
      params.require(:service).permit(:user_id, :address, :paid, :meeting_time)
    end
    
end