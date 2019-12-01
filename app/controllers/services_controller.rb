class ServicesController < ApplicationController
 before_action :right_user,     only: [:destroy]
  
  def index
    @addresses_to_select=current_user.addresses.all
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
    if @service.meeting_time.present?
      busymaids=Service.where("meeting_time = ?", @service.meeting_time).pluck(:maid_id) 
      i=0
      while i < Maid.all.count && busymaids.include?(Maid.all[i].id) 
       i+=1
      end
      if i>=Maid.all.count
        flash[:alert] = "There's no maids available that day, please choose a different day"
      else
        @service.update(maid_id: Maid.all[i].id)
      end
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
  
    def right_user
      redirect_to(root_url) && flash[:alert]= "you can't do that you little hacker" unless Service.find(params[:id]).user_id == current_user.id
    end

    def service_params
      params.require(:service).permit(:user_id, :address, :paid, :meeting_time)
    end
    
end