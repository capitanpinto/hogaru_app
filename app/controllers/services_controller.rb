class ServicesController < ApplicationController
  def home
    if current_user
      @service = current_user.services.build
    end 
  end
  
  def create
    @service = current_user.services.build(service_params)
    @service.update(paid: false)
    if @service.save
      flash[:success] = "You have requested a service!"
      redirect_to root_url
    else
      render 'services#home'
    end
  end
  
  
  private

    def service_params
      params.require(:service).permit(:user_id, :price, :paid, :meeting_time)
    end
    
end

