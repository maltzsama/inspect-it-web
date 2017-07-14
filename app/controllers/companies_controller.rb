class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :destroy]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path, flash: { success: "A empresa #{@company.name} foi salva com sucesso." }
    else
      redirect_to companies_path, flash: { error: "Falha ao salvar a empresa #{@company.errors.messages.first}." }
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_path, flash: { alert: "A empresa #{@company.name} foi deletada."}
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
