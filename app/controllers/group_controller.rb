class GroupController < ApplicationController

    def index
        logger.info "-----Index------"
        @group = Group.all
    end
    
    def new
        logger.info "-----New------"
        @group = Group.new
        @workspace=Workspace.find(session[:current_workspace])   
        @groups = Group.where(:workspace_id => @workspace.id)       
    end
      
    def create
        logger.info "-----Create #{params[:id]}------"
        @workspace=Workspace.find(params[:workspace_id])
        @c=Workspace.last     
        @group = Group.new(name:params[:name],purpose:params[:purpose],access_type:params[:ass_typ],workspace_id:@c.id,level:"owner")        
          if @group.save
            session[:current_group]=@group.id
            @b=Group.last
            @currentgroup=Groupuser.create(user_id:current_user.id,group_id:@b.id,level:"owner")
            @currentgroup.save          
            redirect_to workspace_path(@workspace)          
          end
    end

    def show
        logger.info "-----Show #{params[:id]}------"
        @group = Group.find(params[:id])        
        session[:currentgroup]=@group.id 
        @message =Groupconversation.new 
        @groupconversations=Groupconversation.where(:group => @group.id)
    end

    def edit
        logger.info "-----Edit #{params[:id]}------"
        @group = Group.find(params[:id])
    end
    
    def update
        logger.info "-----Update #{params[:id]}------"
        @group= Group.find(params[:id])
        if @group.update_attributes(group_params)       
           redirect_to workspace_path       
        else
           flash[:danger] = "Update is not success."
           render "edit"
        end
    end  
    
    def destroy 
        logger.info "-----Destroy #{params[:id]}------"
        Group.find(params[:id]).destroy
        @workspace=Workspace.find(session[:current_workspace]) 
        redirect_to workspace_path(@workspace)
    end    
    
    private
    def group_params
        params.require(:group).permit(:name, :purpose,:access_type,:workspace_id,:level)
    end

    def groupsuser_params 
       params.require(:groupsuser).permit(:group_id,:user_id)
    end     
end
