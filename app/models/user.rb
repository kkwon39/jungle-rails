class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews

  validates :first_name, :last_name, :email, :password_digest, presence: true
  validates_length_of :password, minimum: 8
  validates_uniqueness_of :email, :case_sensitive => false

  def self.authenticate_with_credentials(email, password)
    email = email.strip
    user = User.where('lower(email) = ?', email.downcase).first
    if user.authenticate(password)
      user
    else
      nil
    end

  end
end
