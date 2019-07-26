module SessionHelper

  def log_in(user)
    session[:user_id] = user.id
  end
 # Returns the current logged-in user (if any).
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end   
  end
  
 # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end 

  def set_workspace(workspace)
    session[:curr_workspace_id] = workspace.id
  end

  def get_workspace
    if !session[:curr_workspace_id].nil?
      Workspace.find(session[:curr_workspace_id])
    end
  end


  def set_group(group)
    session[:curr_group_id]=group.id
  end

  def get_group
    Group.find(session[:curr_group_id])
  end

end
