class FriendshipsController < ApplicationController
  protect_from_forgery with: :exception

  def create
    # Friendship.create(user_id: current_user_id, friend_id: params[:friend_id])
    # Friendship.create(user_id: params[:friend_id], friend_id: current_user_id)
    @new_friendships = Friendship.create_reciprocal_for_ids(current_user_id, params[:friend_id])
    redirect_to user_path(User.find(current_user_id))
  end

  # def destroy
  #   Friendship.destroy_reciprocal_for_ids(current_user_id, params[:friend_id])
  #   redirect_to user_path(User.find(current_user_id))
  # end

end
