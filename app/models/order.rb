require 'nokogiri'
require 'rss'

class Order < ActiveRecord::Base
	using MoneyHelper

	has_many :items, dependent: :destroy
	accepts_nested_attributes_for :items, allow_destroy: true

	COLLECTIONS = [7,12]

	def is_discount_value_positive?
		(self.items.map{|item| item.collection_id}.uniq - COLLECTIONS.uniq).length == 0
	end

	def order_value
		total_amount_net.to_m - shipping_costs.to_m
	end

	def prestige_discount
		rss = RSS::Parser.parse('http://www.yourlocalguardian.co.uk/sport/rugby/rss/', false)
		pubDate_count = 0
		rss.items.each do |item|
			pubDate_count += 1 if item.respond_to? "pubDate"
		end
		pubDate_count
	end

	def fixed_discount
		doc = Nokogiri::HTML(open("https://developer.github.com/v3/#http-redirects"))
		doc.css('script').remove
		doc.css('style').remove
		txt = doc.at('body').inner_text
		txt.scan(/status/).length
	end

	def discount_value
		return 0 unless is_discount_value_positive?
		if total_amount_net.to_m > 14900
			# prestige policy
			amount = prestige_discount
		else
			#fixed policy
			amount = fixed_discount
		end
		amount = order_value.to_m * 0.25 if amount.to_m / order_value.to_m > 0.25
		amount
	end
end
