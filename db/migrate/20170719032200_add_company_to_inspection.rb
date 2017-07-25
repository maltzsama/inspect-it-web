class AddCompanyToInspection < ActiveRecord::Migration[5.1]
  def change
    add_reference :inspections, :company, foreign_key: true
  end
end
