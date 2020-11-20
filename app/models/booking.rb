class Booking < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :user
  belongs_to :tool
end
