class ServicesController < ApplicationController
  
  def index
    @order=current_user.orders.last
    @user = current_user
    if @user.orders.last.present?
       @order=@user.orders.last
      if @user.orders.last.paid != true
       ordernum=@user.orders.last.id
       @services = @user.services.where("order_id = ?", ordernum)
      end
    else
      @services = []
    end
  end
  
  def create
    @service = current_user.services.build(service_params)
    if current_user.orders.last.present?
      ordernumber=current_user.orders.last.id 
      @service.update(order_id: ordernumber)
    end
    if @service.save
      flash[:alert] = "You have requested a service!"
      redirect_to services_path
    else
      flash[:alert] = "Your request wasn't sent, try again!"
      redirect_to services_path
    end
  end
  
  def destroy
    @service=Service.find(params[:id])
    @service.destroy
    flash[:success] = "Service request was deleted"
    redirect_to services_path
  end
  
  
  private

    def service_params
      params.require(:service).permit(:user_id, :address, :paid, :meeting_time)
    end
    
end