class User < ActiveRecord::Base
  has_many :posts

  acts_as_authentic do |c|
  end

  attr_accessible :login, :email, :password, :password_confirmation
end
