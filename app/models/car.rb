class Car < ApplicationRecord
  belongs_to :uploader, class_name: 'User'
  has_many :favourites, dependent: :destroy

  validates_presence_of :delivery, :rental_company, :status, :manufacturer
end
