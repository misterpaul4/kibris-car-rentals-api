class User < ApplicationRecord
  has_secure_password

  before_save :downcase_fields

  def downcase_fields
    self.username.downcase!
  end

  has_many :cars_uploaded, foreign_key: 'uploader_id', class_name: 'Car', dependent: :destroy
  has_many :favourites, dependent: :destroy


  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :role, presence: true
end
