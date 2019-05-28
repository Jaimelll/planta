class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|      
      t.string :codigo
      t.string :descripcion
      t.float :cantidad
      t.integer :orden1
      t.integer :orden2
      t.references :element, foreign_key: true 
      t.references :admin_user, foreign_key: true      
      t.timestamps
    end
  end
end