class CreateRegulations < ActiveRecord::Migration[5.1]
  def change
    create_table :regulations do |t|
      t.string :code
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
