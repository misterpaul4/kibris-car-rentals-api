require 'rails_helper'

RSpec.describe Car, type: :model do
	context 'Associations' do
		it { should have_many(:favourites).dependent(:destroy) }
		it { should belong_to(:uploader).class_name('User') }
	end

	# context 'Validations' do

	# end
end