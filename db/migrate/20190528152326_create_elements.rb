class CreateElements < ActiveRecord::Migration[5.2]
  def change
    create_table :elements do |t|      
      t.string :nombre
      t.string :descripcion
      t.integer :orden1
      t.integer :orden2
      t.integer :fac1
      t.references :admin_user, foreign_key: true      
      t.timestamps
    end
  end
end
