class GroupController < ApplicationController 
 
  def index
    @group = Group.all
  end
  def show
      @group = Group.find(params[:id])
  end
  def new
    @group = Group.new
  end
  def create
    
    @group = Group.new(group_params)
    if @group.save
    redirect_to '/'
  
    else 
	  render 'new'
	  end
  end	
  def edit
    @group = Group.find(params[:id])
  end
  def update
 
       @group= Group.find(params[:id])
    if @group.update_attributes(group_params)
      
      render "show", :id => @group.id
      
    else
      flash[:danger] = "Update is not success."
      render "edit"
    end
  end



  def destroy
  
    Group.destroy(params[:id])

    redirect_to '/'
  end


  private
  def group_params
    params.require(:group).permit(:name,:workspace_id,:purpose,:email,:access_type)
  end
 
end
