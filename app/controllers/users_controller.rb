class UsersController < ApplicationController
  before_action :admin_user,     only: [:index, :destroy]
  
  def show
    @user = User.find(params[:id])
    @services = @user.services
  end
  
  def index
    @users=User.all
  end
  
  
  def destroy
  end
  
  private
    
    def admin_user
      redirect_to(root_url) unless admin_signed_in?
    end

  
end
