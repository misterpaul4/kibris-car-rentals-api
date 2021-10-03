class Favourite < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :cars_favourites, class_name: 'Car'
end
