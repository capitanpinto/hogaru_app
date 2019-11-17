class MaidsController < ApplicationController
  before_action :admin_user,     only: [:index, :destroy]
  before_action :valid_user,     only: [:show]
  
  def show
    @maid = Maid.find(params[:id])
    @services = @maid.services
  end
  
  def index
    @maids=Maid.all
  end
  
  
  def destroy
  end
  
  private
    
    def admin_user
      redirect_to(root_url) unless admin_signed_in? 
    end
    
    def valid_user
      redirect_to(root_url) unless admin_signed_in? || Maid.find(params[:id]) == current_maid
    end

end