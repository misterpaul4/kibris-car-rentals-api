require 'rails_helper'

RSpec.describe Car, type: :model do
	context 'Associations' do
		it { should have_many(:favourites).dependent(:destroy) }
		it { should belong_to(:uploader).class_name('User') }
	end

	context 'Validations' do
		it { should validate_presence_of(:delivery) }
		it { should validate_presence_of(:rental_company) }
		it { should validate_presence_of(:status) }
		it { should validate_presence_of(:manufacturer) }
	end
end