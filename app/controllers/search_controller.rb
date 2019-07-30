class SearchController < ApplicationController

    def index
        logger.info "----index------"
        @workspace = Workspace.page(params[:page])
        @user=User.all
    end

    def search
        logger.info "-----Search------"
       
        if params[:email].nil?
            @workspaces = "null"
            
        else
            user = User.find_by(email:params[:email])
            @workspace_list=User.all.find_by(id: current_user.id).workspaces
            session[:current_workspace]=@workspace_list.ids           
        end
    end

    private

	def workspace_params
        params.require(:workspace).permit(:name, :admin)    
    end
    
    def userworkspace_params
        params.require(:UsersWorkspace).permit(:workspace_id, :user_id)
    end
end
