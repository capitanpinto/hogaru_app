class ServicesController < ApplicationController
  
  def home
    @order = current_user.orders.build if user_signed_in?
  end
  
  def create
    @service = current_user.services.build(service_params)
    @service.update(paid: false)
    if @service.save
      flash[:alert] = "You have requested a service!"
      redirect_to root_url
    else
      flash[:alert] = "Your request wasn't sent, try again!"
      redirect_to root_url
    end
  end
  
  
  private

    def service_params
      params.require(:service).permit(:user_id, :price, :paid, :meeting_time)
    end
    
end