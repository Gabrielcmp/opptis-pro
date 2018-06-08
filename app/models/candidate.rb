class Candidate < ApplicationRecord
  belongs_to :user
  has_many :applications

  mount_uploader :photo, PhotoUploader
end
