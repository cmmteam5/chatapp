class WorkspacesController < ApplicationController 
 
  def index
    @workspace = Workspace.all
  end
  def show
      @workspace = Workspace.find(params[:id])
  end

  def new
    @workspace = Workspace.new
  end
  def create
    logger.info "-----Create------"
    @workspace = Workspace.new(workspace_params)
    if @workspace.save
<<<<<<< HEAD
      @current=Workspace.last
      @currentWorkspace=WorkspaceHasUser.new(user_id:1,workspace_id:@current.id)
      @currentWorkspace.save
     redirect_to root_url
     else
      render 'new'
    end
=======
    @current=Workspace.last
    @userWorkspace=UsersWorkspace.new(workspace_id:@current.id,user_id:1)
    @userWorkspace.save
    redirect_to workspaces_url,notice: "Workspace was successfully created."
>>>>>>> fa35f9f285bf7eb9f47aa8a0e5de6941365353d5
  end
end
  def edit
    @workspace = Workspace.find(params[:id])
  end
  def update
    logger.info "-----Update #{params[:id]}------"
    @workspace = Workspace.find(params[:id])
    if @workspace.update_attributes(workspace_params)
<<<<<<< HEAD
      
      redirect_to workspaces_url
    else 
      

      render action: :edit
=======
      @userWorkspace =UsersWorkspace.find_by(workspace_id: @workspace.id)
      flash[:success] = "Profile updated"
      redirect_to :action => "show", :id => @workspace.id
      #render "show"
    else
      flash[:danger] = "Update is not success."
      render "edit"
>>>>>>> fa35f9f285bf7eb9f47aa8a0e5de6941365353d5
    end
  end

  def destroy
<<<<<<< HEAD
   Workspace.find(params[:id]).delete
    
    redirect_to :action=> "index"
end
  
private

  def set_workspace
    @workspace = Workspace.find(params[:id])
  end
=======
    logger.info "-----Destroy #{params[:id]}------"
    Workspace.destroy(params[:id])

    redirect_to :action => "new"
end
  private
>>>>>>> fa35f9f285bf7eb9f47aa8a0e5de6941365353d5
  def workspace_params
    params.require(:workspace).permit(:name, :admin)

  end
  def userworkspace_params
    params.require(:UsersWorkspace).permit(:workspace_id, :user_id)
  end
end
