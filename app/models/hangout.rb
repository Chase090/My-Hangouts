class Hangout < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :invitations
  has_many :guests, through: :invitations

  serialize :date_options
  serialize :location_options
end
