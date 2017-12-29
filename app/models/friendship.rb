class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User" #this line says you'll have another foreign key in here called friend_id, but it's actually a member of the model User

    def self.create_reciprocal_for_ids(user_id, friend_id)
      user_friendship = Friendship.create(user_id: user_id, friend_id: friend_id)

      friend_friendship = Friendship.create(user_id: friend_id, friend_id: user_id)

      [user_friendship, friend_friendship]
    end

    #NOT WORKING
    # def self.destroy_reciprocal_for_ids(user_id, friend_id)
    #   Friendship.destroy(user_id: user_id, friend_id: friend_id)
    #   Friendship.destroy(user_id: friend_id, friend_id: user_id)
    # end

  private

end
