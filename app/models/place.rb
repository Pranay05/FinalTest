class Place < ApplicationRecord
	belongs_to :user

	geocoded_by :liked_place
    after_validation :geocode, :if => :liked_place_changed?


end
