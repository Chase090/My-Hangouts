class User < ApplicationRecord
  has_many :friendships, dependent: :destroy  #if user is destroyed, so is friendship(s)
  has_many :friends, through: :friendships

  has_many :myhangouts, class_name: "Hangout", foreign_key: "owner_id", dependent: :destroy

  has_many :invitations
  has_many :hangouts, through: :invitations

  has_secure_password

  validates :username, :first_name, :last_name, :email, presence: true
  validates :username, uniqueness: true

  def to_s
    first_name + " " + last_name
  end

  def username_with_full_name
    username + " (" + self.to_s + ")"
  end

  def hangouts_count
    hangouts.count
  end

  def invitations_count
    hangouts.select do |h|
      h.confirmed == true
    end.count
  end


end
