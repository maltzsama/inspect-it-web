class AddFieldToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, default: "", null: false
    add_column :users, :code, :string, default: "", null: false
    
    add_index :users, :code, unique: true

  end
end
