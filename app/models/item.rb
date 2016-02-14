class Item < ActiveRecord::Base
	attr_accessor :tags
	belongs_to :order
	serialize :tags, Array
end
