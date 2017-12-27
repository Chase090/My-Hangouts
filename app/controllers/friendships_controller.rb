class FriendshipsController < ApplicationController
  protect_from_forgery with: :exception

  def create
    Friendship.create(user_id: current_user_id, friend_id: params[:friend_id])
    Friendship.create(user_id: params[:friend_id], friend_id: current_user_id)
    redirect_to user_path(User.find(current_user_id))

  end



end
