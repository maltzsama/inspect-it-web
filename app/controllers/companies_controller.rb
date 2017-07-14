class CompaniesController < ApplicationController
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
      redirect_to computers_path, flash: { error: "Falha ao salvar a empresa #{msg}." }
    end
  end

  def destroy
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
