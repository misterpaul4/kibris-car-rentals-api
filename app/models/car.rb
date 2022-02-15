class Car < ApplicationRecord
  belongs_to :uploader, class_name: 'User'
  has_many :favourites, dependent: :destroy

  validates_presence_of :delivery, :manufacturer
  validates :availability, presence: true, inclusion: { in: %w(true false pending)  }
  validates :delivery, presence: true, inclusion: { in: %w(true false)  }
end
