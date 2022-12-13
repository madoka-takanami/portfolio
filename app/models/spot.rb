class Spot < ApplicationRecord
    belongs_to :user
    geocoded_by :address
    after_validation :geocode

    validates :address, presence: true
end
