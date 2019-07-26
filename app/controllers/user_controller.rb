class UserController < ApplicationController

  def show
    @user=User.find(params[:id])
end

def new
  
  @user = User.new
end

def index
  @users=User.all
end

def create
  
  @user = User.new(name:params[:name],email:params[:email],password:params[:password])
  if @user.save
    #calling from sessionhelper
    #log_in @user
   helpers.log_in(@user)
    flash[:info] = "Welcome"
    redirect_to new_static_page_path
  else 
      render 'new'
  end
end


  private 
  def user_params
    params.require(:user).permit(:name, :email, :password_digest)
  end
    
end
