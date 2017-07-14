class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name,     null: false, default: ""
      t.string :cnpj,     null: false, default: ""
      t.string :address
      t.string :phone, null: false, default: ""
      t.string :contact

      t.timestamps
    end
    add_index :companies, :cnpj, unique: true
  end
end
