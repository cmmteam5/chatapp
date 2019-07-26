class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      helpers.log_in (user)      # Log the user in and redirect to the user's show page.      
      #session[:user_id] = user.id
      redirect_to new_static_page_path
    else
      # Create an error message.
      flash.now[:danger]='Invalid! Try again'
      redirect_to new_session_path
    end
  end

  def destroy
    flash.now[:alert]='Logout successfully'
    log_out
    redirect_to root_url
  end
end
