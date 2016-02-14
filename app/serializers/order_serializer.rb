class OrderSerializer < ActiveModel::Serializer
  include ApplicationHelper

  attributes :id, :email, :total_amount_net, :shipping_costs, :payment_method, :discount_value

  has_many :items, key: :items

  def discount_value
  	return 0 unless object.is_discount_value_positive?
  	if object.total_amount_net.to_f > 149
  		# prestige policy
  		amount = prestige_discount
  	else
  		#fixed policy
  		amount = fixed_discount
  	end
  	amount = object.order_value * 0.25 if amount / object.order_value > 0.25
  	amount
  end
end
