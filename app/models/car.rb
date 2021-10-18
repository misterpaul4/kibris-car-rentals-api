class Car < ApplicationRecord
  belongs_to :uploader, class_name: 'User'
  has_many :favourites, dependent: :destroy
end
