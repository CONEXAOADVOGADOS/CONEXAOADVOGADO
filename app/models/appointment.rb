class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :experience
  accepts_nested_attributes_for :experience
  monetize :amount_cents
end
