class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews

  validates :first_name, :last_name, :email, :password_digest, presence: true
  validates_uniqueness_of :email, :case_sensitive => false

end
