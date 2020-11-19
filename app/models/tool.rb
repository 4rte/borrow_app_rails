class Tool < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  # multisearchable against: [:name, :description, :address]
  pg_search_scope :search_by_name,
    against: [:name, :description, :address, :category],
    using: {
      tsearch: { prefix: true }
    }
end
