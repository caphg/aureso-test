class ItemSerializer < ActiveModel::Serializer
  attributes :name, :qnt, :value, :category, :subcategory, :collection_id, :tags
end
