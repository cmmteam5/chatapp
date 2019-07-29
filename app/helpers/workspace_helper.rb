module WorkspaceHelper
	
    def set_workspace(worksapce)
        session[:curr_workspace_id] = workspace.id
    end
    def get_workspace
        if !session[:curr_workspace_id].nil?
            workspace.find(session[:curr_workspace_id])
        end
    end  
end
