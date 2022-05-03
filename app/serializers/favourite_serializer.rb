class FavouriteSerializer < ActiveModel::Serializer
  attributes :id, :car
  belongs_to :user
  belongs_to :car
end
