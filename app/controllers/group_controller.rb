class GroupController < ApplicationController

    def index
        @group = Group.all
    end
    def show
          @group = Group.find(params[:id])
          @message =Groupconversation.new
          @messages = Groupconversation.where(:group => @group.id)
    end
    def new
        @group = Group.new
       
        @groups = Group.all
       
    end
      
    def create
        #@workspace=Workspace.find(params[:workspace_id])   
        @c=Workspace.last
        group = Group.new(name:params[:name],purpose:params[:purpose],access_type:params[:ass_typ],workspace_id:@c.id,level:"owner")
          if group.save
          @b=Group.last
          @currentgroup=Groupuser.create(user_id:current_user.id,group_id:@b.id,level:"owner")
          @currentgroup.save
          redirect_to group_path(group.id)
          
        end
      end
      def edit
        @group = Group.find(params[:id])
      end
    
      def update
        @group= Group.find(params[:id])
      if @group.update_attributes(group_params)
        #redirect_to :action => "show", :id => @group.id
        redirect_to '/group'
       
      else
       flash[:danger] = "Update is not success."
       render "edit"
      end
      end
    
    
    
      def destroy
      
        Group.destroy(params[:id])
          redirect_to root_path
      end
    
    
      private
      def group_params
        params.require(:group).permit(:name, :workspace_id, :purpose,:access_type)
      end
      def groupsuser_params 
       params.require(:groupsuser).permit(:group_id,:user_id)
      end
     
end
