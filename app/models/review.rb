class Review < ApplicationRecord
  belongs_to :booking
  validates :content, length: { maximum: 40 }
end
