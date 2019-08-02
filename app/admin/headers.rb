ActiveAdmin.register Header do

 

permit_params :fecha1,  :admin_user_id

menu  priority: 6, label: "Encabezado"


filter :fecha1


index :title => 'Lista de Encabezados' do


column("fecha1") 



actions
end



form do |f|

f.inputs "Encabezado" do

f.input :fecha1


f.input :admin_user_id, :input_html => 
      { :value => current_admin_user.id }, :as => :hidden

end




f.actions

end


show do


attributes_table do

 
  row :fecha1

  row "Modificado por" do |prod|
    AdminUser.where(id:prod.admin_user_id).
    select('email as dd').first.dd
  end 
  
  end



end
end