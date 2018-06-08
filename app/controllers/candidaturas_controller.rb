class CandidaturasController < ApplicationController

  def create
    @opening_id = params[:opening_id]
    Candidatura.create(candidate: current_user.candidate, opening_id: @opening_id)
    respond_to do |format|
      format.html { redirect_to openings_path(@opening_id), notice: 'Candidatura efetuada com sucesso' }
    end
  end

  def destroy
    @candidatura = Candidatura.find(params[:id])
    @candidatura.destroy
    respond_to do |format|
      format.html { redirect_to openings_path(@opening_id), notice: 'Candidatura removida com sucesso' }
    end
  end

end
