class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: friend.id)
    if current_user.save
      flash[:notice] = "You are now following #{friend.name} "
    else
      flash[:alert] = "There was something wrong with the tracking request"
    end
    redirect_to friends_path
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    friend = User.find(params[:id])
    flash[:notice] = "You stopped following #{friend.name}"
    redirect_to friends_path
  end
end
