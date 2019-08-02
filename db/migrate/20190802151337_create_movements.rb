class CreateMovements < ActiveRecord::Migration[5.2]
  def change
    create_table :movements do |t|
      t.references :header, foreign_key: true
      t.integer :intm01
      t.integer :intm02
      t.integer :intm03
      t.integer :intm04
      t.string :strim01
      t.string :strim02
      t.string :strim03
      t.string :strim04
      t.float :floam01
      t.float :floam02
      t.float :floam03
      t.float :floam04


      t.references :admin_user, foreign_key: true
      t.timestamps
    end
  end
end
