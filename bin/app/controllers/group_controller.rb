class GroupController < ApplicationController 
 
  def index
  
      @group = Group.all
  end

  def new     
      @workspace=Workspace.find(session[:curr_workspace_id])
      @group = Group.new
     
  end

  def create
     
      @workspace=Workspace.find(params[:workspace_id])   
      @c=Workspace.last
      @group = Group.new(name:params[:name],purpose:params[:purpose],access_type:params[:ass_typ],workspace_id:@c.id)
        if @group.save
        session[:currentgroup]=@group.id
        @b=Group.last
        @currentgroup=Groupuser.create(user_id:current_user.id,group_id:@b.id,level:"owner")
        @currentgroup.save        
        redirect_to @workspace
        end
  end

  def show     
      @group = Group.find(params[:id])
      @workspace=Workspace.find(session[:curr_workspace_id])     
      session[:currentgroup]=@group.id
      @message =Groupconversation.new 
      @groupconversations=Groupconversation.where(:group => @group.id)      
  end
  def edit
   
      @group = Group.find(params[:id])
  end

  def update
      
      @group= Group.find(params[:id])
        if @group.update_attributes(group_params)           
          redirect_to '/group'          
        else
        flash[:danger] = "Update is not success."
        render "edit"
        end
  end

  def destroy    
      Group.destroy(params[:id])
      redirect_to workspace_path(@workspace)
  end

  private
  def group_params
      params.require(:group).permit(:name, :workspace_id, :purpose,:access_type)
  end
  def groupsuser_params 
      params.require(:groupsuser).permit(:group_id,:user_id)
  end 
end
