class Car < ApplicationRecord
  belongs_to :uploader, class_name: 'User'
  has_and_belongs_to_many :favourites
end
