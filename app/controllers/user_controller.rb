class UserController < ApplicationController

    def show
        logger.info "-----Show #{params[:id]}-------"
        @user=User.find(params[:id])
    end

    def new 
        logger.info "-----New------"     
        @user = User.new
    end

    def index
        logger.info "-----Index------"
        @users=User.all
    end

    def create
        logger.info "-----Create #{params[:id]}-------"
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
