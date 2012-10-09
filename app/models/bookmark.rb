class Bookmark < ActiveRecord::Base
  attr_accessible :domain_name, :url, :name, :count, :user_id
  belongs_to :user
end
