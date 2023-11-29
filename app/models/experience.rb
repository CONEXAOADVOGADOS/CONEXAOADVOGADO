class Experience < ApplicationRecord
  belongs_to :user
  # has_many :appointments
  validates :category, presence: true
  validates :specialty, presence: true
  validates :description, presence: true
  validates :local, presence: true
  validates :date, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
end