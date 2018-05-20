class Candidatura < ApplicationRecord
  belongs_to :opening
  belongs_to :candidate

  def restaurant
    self.opening.restaurant
  end
end
