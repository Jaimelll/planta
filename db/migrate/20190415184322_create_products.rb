class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      
      t.string :codigo
      t.string :nombre
      t.string :descripcion
      t.float :precio
      t.float :costo
      t.integer :unidad
      t.integer :seccion
      t.float :inventario      
      t.float :pedido               
      t.integer :clase      
      t.integer :familia  
      t.integer :nivel  
      t.date :fecha  
      t.integer :orden  
      t.integer :activo   
      t.references :admin_user, foreign_key: true      
      t.timestamps
    end
  end
end
