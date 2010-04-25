class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, :through => :tags

  validates_presence_of :name
end
