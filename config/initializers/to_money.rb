module MoneyHelper
	refine Numeric do
		def to_m
			self.to_s.gsub(/[^0-9]/, '').to_i
		end
	end
end