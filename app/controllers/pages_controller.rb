class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home,:candidato,:restaurante]

  def home
  end

  def candidato
  end

  def restaurante
  end
end
