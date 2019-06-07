class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :password_diest, presence: true
  validates :session_token, presence: true, uniqueness: true

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?
    BCrypt::Password.create(user.password_digest).is_password?(password) ? user : nil
  end

end
