class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :salt

  def login 
    email
  end
  
end
