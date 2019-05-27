class CreateFormulas < ActiveRecord::Migration[5.2]
  def change
    create_table :formulas do |t|

      t.string :codigo
      t.references :product, foreign_key: true
      t.string :obs	
      t.float :cantidad
      t.float :factor
      t.integer :unidad      
      t.integer :seccion      
      t.float :pedido
      t.integer :for1    
      t.integer :for2
      t.float :for3
      t.float :for4
      t.string :for5
      t.string :for6
      t.references :admin_user, foreign_key: true




      t.timestamps
    end
  end
end
