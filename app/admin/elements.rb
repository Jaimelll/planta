ActiveAdmin.register Element do



    permit_params :nombre, :descripcion, :orden1, :orden2,
    :fac1,  :admin_user_id,
    details_attributes: [:id, :codigo, :descripcion, :orden1, :orden2, :_destroy]

menu  priority: 5, label: "Parametros"

ActiveAdmin.register Detail do
belongs_to :element
end




filter :nombre
filter :descripcion
filter :orden1
filter :orden2
filter :fac1

index :title => 'Lista de Parametros' do

column("nombre") do |elem|
link_to "#{elem.nombre} ", admin_element_details_path(elem)
end
column("descripcion") 
column("orden1")     
column("orden2")
column("fac1")



actions
end



form do |f|

f.inputs "Parametros" do

f.input :nombre
f.input :descripcion
f.input :orden1
f.input :orden2
f.input :fac1

f.input :admin_user_id, :input_html => 
      { :value => current_admin_user.id }, :as => :hidden

end
f.inputs do
  f.has_many :details, heading: 'Detalles',
                          allow_destroy: true,
                          new_record: true do |a|
   
    a.input :codigo, :input_html => { :style =>  'width:30%'}
    a.input :descripcion, :input_html => { :style =>  'width:30%'}
    a.input :orden1, :input_html => { :style =>  'width:30%'}
    a.input :orden2, :input_html => { :style =>  'width:30%'}
  end
end


f.actions

end


show do


attributes_table do

  row ("nombre") do |producto|
    link_to "#{producto.nombre} ", admin_element_details_path(element)
  end
  
  row :nombre
  row :descripcion
  row :orden1
  row :orden2
  row :fac1

  row "Modificado por" do |prod|
    AdminUser.where(id:prod.admin_user_id).
    select('email as dd').first.dd
  end 
  panel "Table of Contents" do
    table_for element.details do
      column :descripcion
      column :orden1
      column :orden2
    end
  end



end

end


end
