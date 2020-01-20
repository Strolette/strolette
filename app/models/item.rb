class Item < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo
end
