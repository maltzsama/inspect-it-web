json.extract! company, :id, :name, :cnpj, :address, :phone, :contact
json.url company_url(company, format: :json)