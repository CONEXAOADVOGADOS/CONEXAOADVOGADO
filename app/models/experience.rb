class Experience < ApplicationRecord
  belongs_to :user
  has_many :appointments
  validates :category, presence: true
  validates :specialty, presence: true
  validates :description, presence: true
  validates :local, presence: true
  validates :date, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  has_one_attached :photo 
  has_many :users, through: :appointments
  has_many_attached :photos
  has_many :photos

  include PgSearch::Model

  pg_search_scope :search_by_category_and_local_and_date,
                  against: %i[category local date],
                  using: {
                    tsearch: { prefix: true }
                  }
end
