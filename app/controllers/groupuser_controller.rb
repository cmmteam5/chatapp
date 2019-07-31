class GroupuserController < ApplicationController

    def index 
        logger.info "-----index------"
        @users = User.where.not(id: current_user)
        @workspace =Workspace.find(session[:current_workspace])    
        @group = Group.where(:workspace => session[:current_workspace])
        
    end

    def update
        logger.info "-----Update -----"
        @invite_user = User.find(params[:id])
        @invite_gp = Group.find(params[:group_id])
        @invite = Groupuser.find_by(user: @invite_user, group: @invite_gp, level: "member")
        @uninvite = Groupuser.find_by(user: @invite_user, group: @invite_gp, level: "")
        if @invite.nil? && @uninvite.nil?
           @curr_invite = Groupuser.new(:user => @invite_user, :group => @invite_gp, :level => "member")
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
    def groupsuser_params 
        params.require(:groupsuser).permit(:group_id,:user_id,:level)
    end
end

