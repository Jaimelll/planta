ActiveAdmin.register Movement do

  menu false
    

  permit_params :intm01, :intm02, :intm03, :intm04, 
                :strim01, :strim02, :strim03, :strim04, 
                :floam01, :floam02, :floam03, :floam04, 
                :header_id, :admin_user_id


  
 
  
  
  index :title => "Movimiento"  do
 


          column("Material") do |movim|
            if Product.where(id:movim.intm01).count>0 then
              Product.where(id:movim.intm01).select('nombre as dd').first.dd
            end
          end   

          column("Piezas") do |movim|
            movim.floam01
          end  
          column("Pedido Kg")do |movim|
          movim.floam02
          end  

            actions
        end
  
  
  
  
  
  
            form do |f|
  
  
                 nn=Header.where(id:params[:header_id]).
                          select('strih01 as dd').first.dd

                f.inputs "#{nn}" do
                f.input :header_id, :label => 'Pedido' ,
                         :input_html => { :value => params[:header_id]}, :as => :hidden
               
                f.input :intm01, :label => 'Material', :as => :select, :collection =>
                         Product.order('nombre').map{|u| [u.nombre, u.id]}


                f.input :floam01, :label => 'Piezas', :input_html => { :style =>  'width:30%'}
                f.input :floam02, :label => 'Pedido Kg', :input_html => { :style =>  'width:30%'}
               
                
                f.input :admin_user_id, :input_html => 
                         { :value => current_admin_user.id }, :as => :hidden
             end
                f.actions
          end
  
  
  
          show :title => ' Producto'  do

  
            attributes_table do
  
              row :intm01
              row :floam01
              row :floam01

              row "Modificado por" do |movim|
                AdminUser.where(id:movim.admin_user_id).
                select('email as dd').first.dd
              end 
            end
  
        end
  
      
end
