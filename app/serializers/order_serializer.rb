class OrderSerializer < ActiveModel::Serializer
  include ApplicationHelper

  attributes :id, :email, :total_amount_net, :shipping_costs, :payment_method, :discount_value

  has_many :items, key: :items

  def discount_value
    object.discount_value
  end
end
