class User < ApplicationRecord

  has_secure_password

  has_many :npcs
  has_many :locations

end
