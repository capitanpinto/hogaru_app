class UsersController < ApplicationController
  before_action :admin_user,     only: [:index, :destroy]
  before_action :valid_user,     only: [:show]
  
  def show
    @user = User.find(params[:id])
    @services = @user.services
  end
  
  def index
    @users=User.all.page(params[:page])
  end
  
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "The user was deleted"
    redirect_to users_path
  end

  private
    
    def admin_user
      redirect_to(root_url) unless admin_signed_in?
    end
    
    def valid_user
      redirect_to(root_url) unless admin_signed_in? || User.find(params[:id])==current_user
    end
  
end
