class Invitation < ApplicationRecord
  belongs_to :hangout

  belongs_to :guest, class_name: "User"


end
