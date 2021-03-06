class OpeningsController < ApplicationController
  before_action :set_opening, only: [:show, :edit, :update, :destroy]

  # GET /openings
  # GET /openings.json
  def index
    if current_user.role == 'restaurant'
      @openings = Opening.where(restaurant: current_user.restaurant)
      @profile  = current_user.restaurant
    else
      @openings = Opening.all
      @profile  = current_user.candidate
    end
  end


  def candidate
    if current_user.role == 'candidate'
      @openings = Candidatura.where(candidate: current_user.candidate).map{ |c| c.opening }
    end
    render 'index'
  end
  # GET /openings/1
  # GET /openings/1.json
  def show
    if current_user.role == 'restaurant' && @opening.restaurant == current_user.restaurant
      @candidaturas = Candidatura.where(opening: @opening)
    elsif current_user.role == 'candidate'
      @candidatura = Candidatura.find_by(candidate: current_user.candidate.id, opening: @opening)
    end
  end

  # GET /openings/new
  def new
    @opening = Opening.new
  end

  # GET /openings/1/edit
  def edit
  end

  # POST /openings
  # POST /openings.json
  def create
    @opening = Opening.new(opening_params)
    @opening.restaurant = current_user.restaurant
    respond_to do |format|
      if @opening.save
        format.html { redirect_to @opening, notice: 'Vaga criada com sucesso.' }
        format.json { render :show, status: :created, location: @opening }
      else
        format.html { render :new }
        format.json { render json: @opening.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /openings/1
  # PATCH/PUT /openings/1.json
  def update
    respond_to do |format|
      if @opening.update(opening_params)
        format.html { redirect_to @opening, notice: 'A Vaga foi atualizada.' }
        format.json { render :show, status: :ok, location: @opening }
      else
        format.html { render :edit }
        format.json { render json: @opening.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /openings/1
  # DELETE /openings/1.json
  def destroy
    @opening.destroy
    respond_to do |format|
      format.html { redirect_to openings_url, notice: 'Vaga removida com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_opening
    @opening = Opening.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def opening_params
    params.require(:opening).permit(:title, :beginning_date, :end_date, :pref_sex, :pref_age, :previous_experience, :description)
  end

end
