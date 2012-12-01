class Feed < ActiveRecord::Base
  belongs_to :user

  attr_accessible :options, :title, :url, :user_id, :etag, :last_modified

  serialize :options, Hash

  def self.update_feeds
    Feed.all.each do |f|
      feed = Feedzirra::Feed.fetch_and_parse(f.url)
      puts ("updating #{f.title} - etag #{f.etag} => #{feed.etag}, last_modified #{f.last_modified} => #{feed.last_modified}")
      f.update_attributes(:etag => feed.etag, :last_modified => feed.last_modified)
    end
  end

end
