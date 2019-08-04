class AddIntm05ToMovements < ActiveRecord::Migration[5.2]
  def change
    add_column :movements, :intm05, :integer
    add_column :movements, :intm06, :integer
    add_column :movements, :intm07, :integer
    add_column :movements, :intm08, :integer
    add_column :movements, :intm09, :integer
    add_column :movements, :intm10, :integer
    add_column :movements, :floam05, :float
    add_column :movements, :floam06, :float
    add_column :movements, :floam07, :float
    add_column :movements, :floam08, :float
    add_column :movements, :floam09, :float
    add_column :movements, :floam10, :float
  end
end
