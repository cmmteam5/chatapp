class WorkspaceController < ApplicationController

    def index
        @workspace = Workspace.all
       
      
        
    end
    
    def show
        @workspace = Workspace.find(params[:id])
        helpers.set_workspace @workspace
        @group = Group.all
        @group = Group.where(:workspace => @workspace.id)
    end
    
    def new

        @workspace = Workspace.new
    end
    
    def create
        
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
    
    def edit
        @workspace = Workspace.find(params[:id])
        @groups = Group.all
    end
    
    def update
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
        Workspace.destroy(params[:id])
        redirect_to root_path,notice:"#{t('Workspace was successfully deleted')}"
    end
    
     
      private
    
    def workspace_params
        params.require(:workspace).permit(:name, :admin)
    end
    def userworkspace_params
        params.require(:UsersWorkspace).permit(:workspace_id, :user_id,:level)
    end
end
