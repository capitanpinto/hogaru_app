class AddressesController < ApplicationController
   before_action :right_user,     only: [:destroy]
   
  def index
    @addresses=current_user.addresses
  end
  
  def create
    @address = current_user.addresses.build(address_params)
    if @address.save
      flash[:alert] = "You have added a new address!"
      redirect_to  addresses_path
    else
      flash[:alert] = "Something went wrong please try again!"
      redirect_to addresses_path
    end
  end
  
  def destroy
    @address=Address.find(params[:id])
    @address.destroy
    flash[:success] = "Address was deleted"
    redirect_to addresses_path
  end
  
  private

    def address_params
      params.require(:address).permit(:user_id, :location)
    end
    
    def right_user
      redirect_to(root_url) && flash[:alert]= "You can't do that you little hacker" unless Address.find(params[:id]).user_id == current_user.id
    end
  
end
