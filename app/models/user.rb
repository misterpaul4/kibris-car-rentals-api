class User < ApplicationRecord
  has_secure_password

  before_save :downcase_fields

  def downcase_fields
    self.username.downcase!
  end

  has_many :cars_uploaded, foreign_key: 'uploader_id', class_name: 'Car', dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :waiting_lists, foreign_key: 'applicant_id', class_name: 'WaitingList', dependent: :destroy


  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 5 }
  validates :role, presence: true, inclusion: { in: %w(user admin) }
  validates :company_name, presence: true, if: -> {role == 'admin'}
end
