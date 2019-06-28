class GroupController < ApplicationController

  before_action :set_group, only: [:show, :edit, :update, :destroy]


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
    @group =Group.new(group_params)
    if @group.save
     redirect_to "/"
     else
      render 'new'     
    end
  end


  def edit
    @group = Group.find(params[:id])
  end

  def update  
    if @group.update_attributes(group_params)
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
    @group =Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :workspace_id, :purpose, :email, :access_type)
    end
  end


