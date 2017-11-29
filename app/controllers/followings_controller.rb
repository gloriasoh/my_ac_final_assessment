class FollowingsController < ApplicationController

  def create
  @user = User.find(params[:leader_id])
  current_user.follow(@user)
  redirect_to root_path
end

def destroy
  @user = Following.find(params[:id]).leader
  current_user.unfollow(@user)
  redirect_to root_path
end

end
