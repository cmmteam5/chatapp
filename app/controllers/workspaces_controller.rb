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
      @current=Workspace.last
      @userWorkspace=UsersWorkspace.new(workspace_id:@current.id,user_id:1)
      @userWorkspace.save
     redirect_to workspaces_url,notice:"Workspace has successfully created."
     else
      render 'new'
    end
  end

  def edit
    @workspace = Workspace.find(params[:id])
  end
  def update
    logger.info "-----Update #{params[:id]}------"
    @workspace = Workspace.find(params[:id])
    if @workspace.update_attributes(workspace_params)

      @userWorkspace =UsersWorkspace.find_by(workspace_id: @workspace.id)
      flash[:success] = "Profile updated"
      redirect_to :action => "show", :id => @workspace.id
      #render "show"
     else
      flash[:danger] = "Update is not success."
      render "edit"
     end

    end
 

  def destroy
    logger.info "-----Destroy #{params[:id]}------"
    Workspace.destroy(params[:id])

    redirect_to :action => "new"
  end
  private

  def workspace_params
    params.require(:workspace).permit(:name, :admin)

  end
  def userworkspace_params
    params.require(:UsersWorkspace).permit(:workspace_id, :user_id)
  end
end
