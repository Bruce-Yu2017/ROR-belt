class GroupsController < ApplicationController
  def new
    @user = User.find(session[:user_id])
    @groups = Group.all
  end

  def create
    @groups = Group.new group_params
    if @groups.save 
      redirect_to "/groups/new"
    else
      flash[:errors] = @groups.errors.full_messages
      redirect_to "/groups/new"
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy 
    redirect_to "/groups/new"
  end

  private 
    def group_params
      params.require(:group).permit(:name, :description).merge(user: current_user)
    end
end
