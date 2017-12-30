class User < ApplicationRecord
  has_many :friendships, dependent: :destroy  #if user is destroyed, so is friendship(s)
  has_many :friends, through: :friendships

  has_many :invitations, foreign_key: "guest_id", dependent: :destroy

  has_many :hangouts, through: :invitations

  has_many :myhangouts, class_name: "Hangout", foreign_key: "owner_id", dependent: :destroy

  has_secure_password

  validates :username, :first_name, :last_name, :email, presence: true
  validates :username, uniqueness: true

  def to_s
    first_name + " " + last_name
  end

  def username_with_full_name
    username + " (" + self.to_s + ")"
  end

  #CONFIRMED + UNCONFIRMED  Hangouts (i.e. All invitations + Your owned hangouts)
  def all_hangouts
    invitations.map do |i|
      i.hangout
    end + myhangouts
  end

  #CONFIRMED Hangouts (i.e. confirmed invitations + Your own)
  def confirmed_hangouts
    invitations.select do |i|
      i.confirmed == true
    end + myhangouts
  end

  def confirmed_hangouts_count
    confirmed_hangouts.count
  end

  #UNCONFIRMED Hangouts (i.e. unconfirmed invites)
  def unconfirmed_hangouts
    invitations.select do |i|
      i.confirmed == false
    end
  end

  def unconfirmed_hangouts_count
    unconfirmed_hangouts.count
  end

  def friends_count
    friends.count
  end


end
