class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :cars_uploaded, foreign_key: 'uploader_id', class_name: 'Car', dependent: :destroy
  has_many :favourites
end
