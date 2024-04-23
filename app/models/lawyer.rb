class Lawyer < ApplicationRecord
  belongs_to :user
  has_many :connections
  validates :state, presence: true
  validates :city, presence: true
  validates :OAB, presence: true
  validates :type, presence: true
  validates :category, presence: true
  validates :faculty, presence: true
  validates :description, presence: true
  validates :status, presence: true

  # validates :price, numericality: { greater_than: 0 }

  has_one_attached :photo
  has_many :users, through: :connections
  has_many_attached :photos
  has_many :photos

  include PgSearch::Model

  pg_search_scope :search_by_category_and_local_and_date,
                  against: %i[category local date],
                  using: {
                    tsearch: { prefix: true }
                  }
end
