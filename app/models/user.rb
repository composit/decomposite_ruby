class User < ActiveRecord::Base
  acts_as_authentic do |c|
  end

  attr_accessible :login, :email, :password, :password_confirmation
end
