require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Associations' do
    it { should have_many(:favourites).dependent(:destroy) }
    it { should have_many(:cars_uploaded).with_foreign_key('uploader_id').class_name('Car').dependent(:destroy) }
  end

  context 'Validations' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  end
end
