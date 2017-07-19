class InspectionsController < ApplicationController
  before_action :set_inspection, only: [:show, :edit, :update, :destroy]

  def index
    @inspections = Inspection.all
  end

  def new
    @inspection = Inspection.new
  end

  def destroy
  end

  def show
  end

  def edit
  end

  def create
    @inspection = Inspection.new(inspection_params)

    respond_to do |format|
      if @inspection.save
        format.html { redirect_to inspections_path, notice: 'Inspeção foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @inspection }
      else
        format.html { render :new }
        format.json { render json: @inspection.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  def set_inspection
    @inspection = Inspection.find(params[:id])
  end
  
  def inspection_params
    params.require(:inspection).permit(:name)
  end
end
