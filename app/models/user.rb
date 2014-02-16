class User < ActiveRecord::Base
  validates :badge, presence: true, uniqueness: true, length: { is: 5 }
  has_secure_password
  validates :password, length: { minimum: 2 }
end
