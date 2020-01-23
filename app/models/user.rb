class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :email, presence: true, uniqueness: true
  # validates :photo, presence: true
end
