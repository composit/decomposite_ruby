class User < ActiveRecord::Base
  has_many :posts

  acts_as_authentic do |c|
  end

  attr_accessible :login, :email, :password, :password_confirmation

  validates_presence_of :login, :email, :crypted_password, :password_salt
end
