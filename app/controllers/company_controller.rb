class CompanyController < ApplicationController
  before_action :set_company, only: [:show, :destroy]


  def index
    @companies = Company.all
  end

  private
    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :address, :phone, :cnpj, :contact)
    end

end
