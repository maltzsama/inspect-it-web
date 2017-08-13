class InspectionsController < ApplicationController
  before_action :set_inspection, only: [:show, :edit, :update, :destroy]

  # GET /inspections
  # GET /inspections.json
  def index
    if params[:company_id].present?
      @company_id = params[:company_id]
      @inspections = Inspection.where(company_id: @company_id)
    else
      @inspections = Inspection.all
    end
  end

  def new
    @inspection = Inspection.new(company_id: params[:company_id])
    @regulations = Regulation.all
  end

  def show
  end

  def edit
  end

  def create
    @inspection = Inspection.new(inspection_params)

    respond_to do |format|
      if @inspection.save
        format.html { redirect_to inspections_path(company_id: inspection_params[:company_id]),
        notice: 'Inspeção foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @inspection }
      else
        format.html { render :new }
        format.json { render json: @inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @inspection.update(inspection_params)
        format.html { redirect_to inspections_path(company_id: inspection_params[:company_id]),
        notice: 'Inspeção atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @inspection }
      else
        format.html { render :edit }
        format.json { render json: @inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inspection.destroy
    respond_to do |format|
      format.html { redirect_to inspections_url, notice: 'Inspeção deletada com sucesso.' }
      format.json { head :no_content }
    end
  end
  
  private
  def set_inspection
    @inspection = Inspection.find(params[:id])
  end
  
  def inspection_params
    params.require(:inspection).permit(:name, :company_id)
  end
end
