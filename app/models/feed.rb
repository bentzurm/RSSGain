class Feed < ActiveRecord::Base
  belongs_to :user

  attr_accessible :options, :title, :url, :user_id

  serialize :options, Hash

end
