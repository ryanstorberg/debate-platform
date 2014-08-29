class User < ActiveRecord::Base

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

  has_many :authored_debates, :foreign_key => "author_id", :class_name => "Debate"
  has_many :comments
  has_many :votes

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && (user.authenticate(password))
    nil
  end

end
