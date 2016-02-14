class Order < ActiveRecord::Base
	has_many :items, dependent: :destroy
	accepts_nested_attributes_for :items, allow_destroy: true

	COLLECTIONS = [7,12]

	def is_discount_value_positive?
		(self.items.map{|item| item.collection_id}.uniq - COLLECTIONS.uniq).length == 0
	end

	def order_value
		total_amount_net.to_f - shipping_costs.to_f
	end
end
