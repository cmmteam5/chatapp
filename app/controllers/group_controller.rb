class GroupController < ApplicationController 
 
  def index
    @group = Group.all
  end
  def show
      @group = Group.find(params[:id])
  end
  def new
    @group = Group.new
    @workspace = Workspace.find(params[:id])
  end

  def create 
    @workspace=Workspace.find(params[:workspace_id])   
    @current=Workspace.last
    @group = Group.new(name:params[:name],workspace_id:@current.id,purpose:params[:purpose],access_type:params[:ass_typ])
    @group.save
    redirect_to workspace_path(@workspace)
  end
  
  def edit
    @group = Group.find(params[:id])
  end

  def update
 
    @group= Group.find(params[:id])
  if @group.update_attributes(group_params)
    redirect_to :action => "show", :id => @group.id
   
  else
   flash[:danger] = "Update is not success."
   render "edit"
  end
  end



  def destroy
  
    Group.destroy(params[:id])

    redirect_to '/'
  end


  private
  def group_params
    params.require(:group).permit(:name, :workspace_id, :purpose,:access_type)
  end
 
end
