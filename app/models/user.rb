class User < ActiveRecord::Base
  before_create :create_remember_token
  validates :badge, presence: true, uniqueness: true, length: { is: 5 }
  has_secure_password
  validates :password, length: { minimum: 2 }
  has_one :ballot

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end
