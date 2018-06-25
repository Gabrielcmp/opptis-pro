class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :openings
  has_many :applications, through: :openings
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :get_address, if: :address_changed?

  private

  def get_address
    google = "https://maps.googleapis.com/maps/api/geocode/json?address="
    key = ENV['GOOGLE_API_SERVER_KEY']
    url = "#{google}#{self.address.unaccent}&key=#{key}"

    if self.address.present?
      address_hash = JSON.parse(open(url).read)
      if address_hash['status'] == 'OK'
        address_hash = address_hash["results"][0]
        self.formatted_address = address_hash["formatted_address"]
        self.latitude = address_hash["geometry"]["location"]["lat"]
        self.longitude = address_hash["geometry"]["location"]["lng"]
      end
    end
  end

end
