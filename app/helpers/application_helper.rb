require 'nokogiri'
require 'rss'

module ApplicationHelper
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
end
