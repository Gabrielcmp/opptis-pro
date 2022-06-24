class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home,:candidato,:restaurante]

  def home
    Sentry.capture_message("test message")
  end

  def candidato
  end

  def restaurante
  end

  def solver
  end
end
