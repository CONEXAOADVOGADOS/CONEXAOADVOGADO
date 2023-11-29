class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :experience, dependent: :destroy
end
