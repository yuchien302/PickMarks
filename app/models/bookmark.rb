class Bookmark < ActiveRecord::Base
  attr_accessible :domain_name, :url, :name, :count
end
