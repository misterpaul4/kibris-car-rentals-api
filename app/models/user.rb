class User < ApplicationRecord
  has_many :cars, foreign_key: 'uploader_id', class_name: 'Car', dependent: :destroy
  has_one :favourite
end
