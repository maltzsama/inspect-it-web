class AddCorrectionToOccurrence < ActiveRecord::Migration[5.1]
  def change
    add_column :occurrences, :correction, :string
  end
end
