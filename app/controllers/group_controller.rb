class GroupController < ApplicationController
<<<<<<< HEAD
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @group =Group.all
  end
  def show
    @group = Group.find(params[:id])
=======
<<<<<<< HEAD
=======

>>>>>>> d2588dfe335c2c0eb356226de4da7c99c7c6997a
  def index
    @group = Group.all
>>>>>>> 05de29f5d70f6be66825cdce2a7b79fa97df5185
  end
  def new
    @group = Group.new
  end
   def create
    @group = Group.new(group_params)
    if @wgroup.save
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

  def destroy
   Group.find(params[:id]).delete
    
    redirect_to :action=> "index"
end
   
  private
  def set_group
    @group =group.find(params[:id])
  end
<<<<<<< HEAD
    def group_params
      params.require(:group).permit(:group name, :purpose, :email)
    end
=======


>>>>>>> 05de29f5d70f6be66825cdce2a7b79fa97df5185
end
