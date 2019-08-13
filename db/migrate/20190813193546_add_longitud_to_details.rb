class AddLongitudToDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :details, :longitud, :float
    add_column :details, :perfil, :integer
    add_column :details, :aleacion, :integer
    add_column :details, :peso, :float
    add_column :details, :salidas, :float
    add_column :details, :pzasxprens, :float
    add_column :details, :culote, :float
    add_column :details, :puntas, :float
  end
end
