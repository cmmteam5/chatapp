class SearchsController < ApplicationController
    def index
        @workspaces=Workspace.all
        @user=User.all
    end

    def search
        if params[:email].nil?
            @workspaces = "null"
        else
            user = User.find_by(email:params[:email])
            @workspaces= UsersWorkspace.where(:user_id => user.id)
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
