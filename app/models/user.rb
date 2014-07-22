require 'bcrypt'
class User < ActiveRecord::Base
  has_many :notes
  attr_reader :entered_password
  include BCrypt

  validates :entered_password, presence: true, :length => { :minimum => 6 }
  validates :email, uniqueness: true, format: /.+@.+\..+/, presence: true # imperfect, but okay


  #this is calling the bcrypt reader #password
  # either invalid email or wrong password
  def self.authenticate(user_params = {})
    user = User.find_by_email(user_params[:email])
    (user && user.password == user_params[:password]) ? user : nil
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @entered_password = pass #added
    @password = Password.create(pass)
    self.password_hash = @password
  end

end
