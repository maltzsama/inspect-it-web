class OccurrencesController < ApplicationController
  before_action :set_occurrence, only: [:show, :edit, :update, :destroy]

  # GET /occurrences
  # GET /occurrences.json
  def index
    if params[:inspection_id].present?
      @inspection_id = params[:inspection_id]
      @occurrences = Occurrence.where(inspection_id: @inspection_id)
    else
      @occurrences = Occurrence.all
    end
  end

  # GET /occurrences/1
  # GET /occurrences/1.json
  def show
  end

  # GET /occurrences/new
  def new
    @occurrence = Occurrence.new(inspection_id: params[:inspection_id])
  end

  # GET /occurrences/1/edit
  def edit
  end

  # POST /occurrences
  # POST /occurrences.json
  def create
    @occurrence = Occurrence.new(occurrence_params)

    respond_to do |format|
      if @occurrence.save
        format.html { redirect_to occurrences_path(inspection_id: occurrence_params[:inspection_id]), 
        notice: 'Ocorrência foi criada com sucesso.' }

        format.json { render :show, status: :created, location: @occurrence }
      else
        format.html { render :new }
        format.json { render json: @occurrence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /occurrences/1
  # PATCH/PUT /occurrences/1.json
  def update
    respond_to do |format|
      if @occurrence.update(occurrence_params)
        format.html { redirect_to occurrence_path(inspection_id: occurrence_params[:inspection_id]),
        notice: 'Ocorrência foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @occurrence }
      else
        format.html { render :edit }
        format.json { render json: @occurrence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /occurrences/1
  # DELETE /occurrences/1.json
  def destroy
    @occurrence.destroy
    respond_to do |format|
      format.html { redirect_to occurrences_url, notice: 'Occurrence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_occurrence
      @occurrence = Occurrence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def occurrence_params
      params.require(:occurrence).permit(:description, :severity, :todo, :image, :inspection_id)
    end
end
