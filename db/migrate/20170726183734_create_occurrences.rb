class CreateOccurrences < ActiveRecord::Migration[5.1]
  def change
    create_table :occurrences do |t|
      t.string :description
      t.string :severity
      t.string :todo

      t.timestamps
    end
  end
end
