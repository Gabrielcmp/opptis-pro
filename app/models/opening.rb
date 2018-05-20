class Opening < ApplicationRecord
  belongs_to :restaurant
  has_many :applications
end
