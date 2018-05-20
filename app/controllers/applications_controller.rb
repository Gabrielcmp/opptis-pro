class ApplicationsController < ApplicationController
  before_action :set_opening_id

  def create
    Application.create(candidate: current_user.candidate, opening_id: @opening_id)
    respond_to do |format|
      format.html { redirect_to openings_path(@opening_id), notice: 'Candidatura efetuada com sucesso' }
    end
  end

  def destroy
    @application = Application.find_by(@opening_id)
    @application.destroy
    respond_to do |format|
      format.html { redirect_to openings_path(@opening_id), notice: 'Candidatura removida com sucesso' }
    end
  end

  private

  def set_opening_id
    @opening_id = params[:opening_id]
  end

end
