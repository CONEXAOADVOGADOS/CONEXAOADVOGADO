class Experience < ApplicationRecord
  belongs_to :user
  has_many :appointments
  validates :category, presence: true
  validates :lawyer_name, presence: true
  validates :description, presence: true
  validates :phone, presence: true
  validates :OAB, presence: true
  validates :mail, presence: true
  # validates :price, numericality: { greater_than: 0 }

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
