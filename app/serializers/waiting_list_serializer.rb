class WaitingListSerializer < ActiveModel::Serializer
  attributes :id, :car, :applicant

  belongs_to :applicant
  belongs_to :car
end
