class Company < ApplicationRecord
    validates :cnpj,    uniqueness: true
    has_many :inspections, :dependent => :delete_all
end
