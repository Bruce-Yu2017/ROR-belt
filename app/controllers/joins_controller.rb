class JoinsController < ApplicationController
  def create
    Join.create join_params
    redirect_to "/groups/new"
  end

  def destroy
    @join = Join.find(params[:id])
    @join.destroy if current_user = @join.user 
    redirect_to "/groups/new"
  end

  private 
    def join_params
      params.require(:join).permit(:group_id).merge(user: current_user)
    end
end
