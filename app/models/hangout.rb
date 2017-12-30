class Hangout < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :invitations
  has_many :guests, through: :invitations
  #
  # serialize :date_options
  # serialize :location_options

  def unconfirmed_guests
    #first - unconfirmed invitations
    unconfirmed = invitations.select do |i|
      i.confirmed == false
    end
    #then - guests on those unconfirmed invitations
    unconfirmed.map do |u|
      u.guest
    end
  end

  def confirmed_guests
    #first - confirmed invitations
    confirmed = invitations.select do |i|
      i.confirmed == true
    end
    #then - guests on those confirmed invitations
    confirmed.map do |c|
      c.guest
    end
  end

  def user_confirmed?(user)
    if owner == user
      true
    elsif guests.include?(user)
      invitation = Invitation.find_by(hangout: self, guest: user)
      if invitation.confirmed == true
        true
      else
        false
      end
    else
      "You have not been invited to this hangout."
    end
  end

  def invitation(user)
    Invitation.find_by(guest: user, hangout:self)
  end
end
