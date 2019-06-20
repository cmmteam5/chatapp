class WorkspacesController < ApplicationController 
  before_action :set_workspace, only: [:show, :edit, :update, :destroy]
  def index
    @workspace = Workspace.all
  end

  def new
    @workspace = Workspace.new
  end
  def create
    @workspace = Workspace.new(workspace_params)
    if @workspace.save
      redirect_to workspaces_url, notice: 'Workspace was successfully created.'
    else
      render 'new'
    end
  end
  
    def edit
      @workspace = Workspace.find(params[:id])
    end
  
 
  def update
  
    if @workspace.update_attributes(workspace_params)
      redirect_to workspaces_url, notice: 'Workspace was successfully updated.'
    else
      render action: :edit
    end
  end

  def delete
  end

  def show
  end
  private
  def set_workspace
    @workspace = Workspace.find(params[:id])
  end
  def workspace_params
    params.require(:workspace).permit(:name)
  end
end
