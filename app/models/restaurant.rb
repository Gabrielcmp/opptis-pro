class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :openings
  has_many :applications, through: :openings
end
