class User < ApplicationRecord
  has_many :cars_uploaded, foreign_key: 'uploader_id', class_name: 'Car', dependent: :destroy
  has_many :favourites, dependent: :destroy

  validates :username, presence: true, uniqueness: true
end
