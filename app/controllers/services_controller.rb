class ServicesController < ApplicationController
  def home
    @service = current_user.services.build
  end
  
  def create
    @service = current_user.services.build(service_params)
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

