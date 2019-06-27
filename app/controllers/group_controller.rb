class GroupController < ApplicationController

<<<<<<< HEAD
  before_action :set_group, only: [:show, :edit, :update, :destroy]

=======
>>>>>>> fa35f9f285bf7eb9f47aa8a0e5de6941365353d5
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
     redirect_to group_url, notice: 'Group was successfully created.'
     else
      render 'new'
    end
  end
  def edit
    @group = Group.find(params[:id])
  end
  def update
    if@group.update_attributes(group_params)
      
      redirect_to group_url
    else 
      

      render action: :edit
    end
  end

<<<<<<< HEAD
  def destroy
   Group.find(params[:id]).delete
    
    redirect_to :action=> "index"
end
   
  private
  def set_group
    @group =Group.find(params[:id])
  end
    def group_params
      params.require(:group).permit(:name, :workspace_id, :purpose, :email, :access_type)
    end
=======
>>>>>>> fef54ffa1db0850f8036f16f4762838a88fa1a37

>>>>>>> fa35f9f285bf7eb9f47aa8a0e5de6941365353d5
end
