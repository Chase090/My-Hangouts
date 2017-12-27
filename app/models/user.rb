class User < ApplicationRecord
  has_many :friendships, dependent: :destroy  #if user is destroyed, so is friendship(s)
  has_many :friends, through: :friendships

  has_secure_password

  validates :username, :first_name, :last_name, :email, presence: true
  validates :username, uniqueness: true

  def to_s
    first_name + " " + last_name
  end

end
