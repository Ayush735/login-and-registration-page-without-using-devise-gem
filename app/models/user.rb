class User < ApplicationRecord

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
  validates :password, confirmation: true
  validates_length_of :password, in: 6..20, on: :create

  def self.authenticate(email='', password='')
    user = User.find_by_email(email) if EMAIL_REGEX.match(email)
    if user && user.match_password(password)
      return user
    else
      return false
    end
  end   

  def match_password(password='')
    self.password == password ? true : false
  end
end