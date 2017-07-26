class AddImageToOccurrence < ActiveRecord::Migration[5.1]
  def change
    add_column :occurrences, :image, :string
  end
end
