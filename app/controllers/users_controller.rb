class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @services = @user.services
  end
  
  def index
    @users=User.all
  end
  
end
