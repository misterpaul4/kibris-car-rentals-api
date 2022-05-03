class Car < ApplicationRecord
  belongs_to :uploader, class_name: 'User'
  has_many :favourites, dependent: :destroy
  has_many :waiting_lists, dependent: :destroy


  def in_waiting_list?(user)
    waiting_lists.where(applicant_id: user.id)
  end

  validates_presence_of :delivery, :manufacturer
  validates :availability, presence: true, inclusion: { in: %w(true false)  }
  validates :delivery, presence: true, inclusion: { in: %w(true false)  }
end
