class UserworkspaceController < ApplicationController

    def index
        logger.info "-----Index-------"
        @users = User.where.not(id: current_user)
    end
  
    def update
        logger.info "-----Update------"
        @invite_user = User.find(params[:id])
        @invite_wp= Workspace.find(params[:workspace_id])
        @invite = Userworkspace.find_by(user: @invite_user, workspace: @invite_wp, level: "member")
        @uninvite =Userworkspace.find_by(user: @invite_user, workspace: @invite_wp, level: "")
        if @invite.nil? && @uninvite.nil?
           @curr_invite = Userworkspace.new(:user => @invite_user, :workspace => @invite_wp, :level => "member")
              if @curr_invite.save
                  redirect_to :action => 'index'
              end
        end
  
        if !@invite.nil?
              @invite.update_attribute(:level, "")
              redirect_to :action => 'index'
        end
  
        if !@uninvite.nil?
              @uninvite.update_attribute(:level, "member")
              redirect_to :action => 'index'
        end
    end
    
    private
    def userworkspace_params
        params.require(:UsersWorkspace).permit(:workspace_id, :user_id,:level)
    end
end
