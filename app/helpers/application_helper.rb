require 'nokogiri'

module ApplicationHelper
	def prestige_discount
		doc = Nokogiri::HTML(open("http://www.yourlocalguardian.co.uk/sport/rugby/rss/"))
		doc.css("pubdate").length
	end

	def fixed_discount
		doc = Nokogiri::HTML(open("https://developer.github.com/v3/#http-redirects"))
		txt = doc.at('body').inner_text
		txt.scan(/status/).length
	end
end
