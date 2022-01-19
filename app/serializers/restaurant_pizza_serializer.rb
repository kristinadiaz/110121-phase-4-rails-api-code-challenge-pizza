class RestaurantPizzaSerializer < ActiveModel::Serializer
  attributes :id, :price
  has_one :restaurant
  has_one :pizza
end
