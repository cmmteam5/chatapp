class GroupconversationsController < ApplicationController
    
    def create 
        logger.info "-----Create #{params[:id]}-----"     
        @message = Groupconversation.new(message:params[:message],group_id:params[:group_id],user_id:current_user.id)    
        @group = Group.find(params[:group_id]) 
        respond_to do |format|
            if @message .save
                format.html { redirect_to @message , notice: 'User was successfully created.' }
                format.js
                format.json { render json: @message , status: :created, location: @message  }
            else
                format.html { render action: "new" }
                format.json { render json: @message.errors, status: :unprocessable_entity }
            end             
        end
    end
    
    def destroy 
        logger.info "-----Destroy #{params[:id]}------"     
        Groupconversation.find(params[:id]).destroy   
        @group=Group.find_by_id( session[:currentgroup])
        redirect_to group_path(@group)
    end  

    def groupconversation_params
        params.require(:groupconversation).permit(:message,:group_id,:user_id)
    end
end
