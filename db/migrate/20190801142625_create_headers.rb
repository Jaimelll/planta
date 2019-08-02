class CreateHeaders < ActiveRecord::Migration[5.2]
  def change
    create_table :headers do |t|
      t.date :fecha1
      t.date :dateh01
      t.date :dateh02
      t.date :dateh03
      t.integer :inth01
      t.integer :inth02
      t.integer :inth03
      t.integer :inth04
      t.integer :inth05
      t.integer :inth06
      t.integer :inth07
      t.integer :inth08
      t.string :strih01
      t.string :strih02
      t.string :strih03
      t.string :strih04

      t.references :admin_user, foreign_key: true
      t.timestamps
    end
  end
end
