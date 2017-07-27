class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :destroy]

  # GET /inspections
  # GET /inspections.json
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
        format.html { redirect_to companies_path, notice: "A empresa #{@company.name} foi salva com sucesso." }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_path, notice: "A empresa #{@company.name} foi deletada." }
      format.json { head :no_content }
    end
  end

  def show
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :cnpj, :address, :phone, :contact)
  end

end
