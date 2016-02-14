class Item < ActiveRecord::Base
	attr_accessor :tags
	attr_accessor :items_attributes
	belongs_to :order
	serialize :tags, Array
	alias_attribute :tags, :tag
end
