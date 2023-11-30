class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :experience, dependent: :destroy

  accepts_nested_attributes_for :experience
end
