class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :experiences, dependent: :destroy
  has_many :appointments, dependent: :destroy


  validates :name, presence: true
  validates :cpf, presence: true, format: { with: /\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/ }
  validates :phone, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates_uniqueness_of :email
  # validates: password_confirmation, presence: true
  validates :password, length: { minimum: 6 }
  # has_many :experiences, through: :appointments
end

#  format: { with:  /\A\(\d{2}\)\d{5}\-\d{4}\z/ }
