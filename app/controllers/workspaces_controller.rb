class WorkspacesController < ApplicationController

    def index
        logger.info "-----Index-------"
        @workspace = Workspace.all        
    end  
    
    def new
        logger.info "-----New-------"
        @workspace = Workspace.new
    end
    
    def create 
        logger.info "-----Create #{params[:id]}-------"  
        @workspace = Workspace.new(workspace_params)
        if @workspace.save          
          @c=Workspace.last
          @userWorkspace=Userworkspace.new(workspace_id:@c.id,user_id:current_user.id,level:"owner")
          @userWorkspace.save
          redirect_to @workspace,notice:'Workspace has successfully created'
        else
         render 'new'          
        end
    end

    def show
        logger.info "-----Show #{params[:id]}-------"
        @workspace = Workspace.find(params[:id])     
        @group = Group.where(:workspace => @workspace.id)     
        @groupuser=Groupuser.all
        @user=User.all
        @userworkspace=Userworkspace.where(:workspace =>@workspace.id)
        @groupuser=Groupuser.where(:group =>@group.ids)
        session[:current_workspace]=@workspace.id

    end
    
    def edit
        logger.info "-----Edit #{params[:id]}-------"
        @workspace = Workspace.find(params[:id]) 
        @groups = Group.all
    end
    
    def update
        logger.info "-----Update #{params[:id]}-------"
        @workspace = Workspace.find(params[:id]) 
        if @workspace.update_attributes(workspace_params)    
           @userWorkspace =Userworkspace.find_by(workspace_id: @workspace.id)
           flash[:success] = "#{t('Profile updated')}"
           redirect_to :action => "show", :id => @workspace.id
           #render "show"
        else
           flash[:danger] = "#{t('Update is not success.')}'"
           render "edit"
        end
    end
     
    
    def destroy
      logger.info "-----Destroy #{params[:id]}-------"
        Workspace.destroy(params[:id])
        redirect_to new_workspace_path,notice:"#{t('Workspace was successfully deleted')}"
    end  
    
    
     
    private    
    def workspace_params
        params.require(:workspace).permit(:name, :admin)
    end
    def userworkspace_params
        params.require(:UsersWorkspace).permit(:workspace_id, :user_id,:level)
    end
end
