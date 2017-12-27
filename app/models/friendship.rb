class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User" #this line says you'll have another foreign key in here called friend_id, but it's actually a member of the model User
  #
  # after_create :create_inverse_relationship
  # after_destroy :destroy_inverse_relationship

  private
  #
  # def create_inverse_relationship
  #   #after a friendship has been created (whether by adding a user_id into @user.friends, or by creating a new Friendship with a user_id and a friend_id (both id's from user objects)-- THEN create a second Friendship instance where user & friend are flipped. This way --not only will @user2 be listed in @user1.friends, but vice versa too
  #   friend.friendships.create(friend:user)
  # end
  #
  # def destroy_inverse_relationship
  #   friendship = friend.friendships.find_by(friend: user)
  #   friendship.destroy if friendship #when would there not be a friendship?
  # end

end
