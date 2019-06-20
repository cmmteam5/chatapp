class WorkspaceController < ApplicationController
  
 
  def index
    @workspaces = Workspace.all
  end

  
  def show
  end

  
  def new
    @workspace = Workspace.new
  end

  
  def edit
   
  end

  
  def create
    @workspace = Workspace.new(name:params[:name],admin:params[:admin])
      if @workspace.save
        redirect_to "/workspaces", notice: 'Workspace was successfully created.'
      else
        render 'new' 
      end    
  end

  
  def update
    @workspace= Workspace.find(params[:id])
    @workspace.update_attributes(name:params[:name],admin:params[:admin])
    redirect_to "/workspaces", notice: 'Workspace updated.'

  end

  
  def destroy
    w = Workspace.find(params[:id])
    usr = WorkspaceHasUser.where(:workspace_id => w.id)
    usr.each {|a|
      a.delete
    }
    w.delete
    redirect_to workspaces_url, notice: 'Workspace was successfully destroyed.' 
    
  end

  private
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def workspace_params
      params.require(:workspace).permit(:name, :admin)
    end
end
