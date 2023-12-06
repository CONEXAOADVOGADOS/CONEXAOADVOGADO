class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :experience
  accepts_nested_attributes_for :experience
  monetize :amount_cents
  has_one_attached :photo
  has_many_attached :photos
  has_many :photos
end
