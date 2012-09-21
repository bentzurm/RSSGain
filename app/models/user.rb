class User < ActiveRecord::Base
  has_many :feeds, dependent: :destroy

  attr_accessible :email, :name, :password, :salt

  def login 
    email
  end

end
