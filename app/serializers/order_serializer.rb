class OrderSerializer < ActiveModel::Serializer
  attributes :id, :email, :total_amount_net, :shipping_costs, :payment_method

  has_many :items, key: :items

end
