
  ActiveAdmin.register Header, as: 'Pedidos' do
  menu  priority: 10,label: "Pedido"

  

  permit_params :fecha1,  :admin_user_id,
  :dateh01,:dateh02,:dateh03,
  :inth01, :inth02, :inth03, :inth04, :inth05, :inth06, :inth07, :inth08, 
  :strih01, :strih02, :strih03, :strih04

    filter :fecha1
      index :title => "Encabezado de pedido"  do
       
 
        column("Fecha", :sortable => :fecha1) do |pedid|
          if pedid.fecha1 then
           vfec=pedid.fecha1.strftime("%d-%m-%Y")
          else
            vfec="s/d"
          end
          link_to vfec, admin_header_movements_path(pedid)
        end
        column("O/P", :sortable => :strih01) do |pedid|
          pedid.strih01
        end
        column("Detalle", :sortable => :strih02) do |pedid|
          pedid.strih02
        end

        
        actions 
      end

      form do |f|
        f.inputs "Encabezado" do
       
          f.input :fecha1, :label => 'Fecha' , as: :datepicker, :input_html =>
                   { :style =>  'width:30%'}
          f.input :strih01,:label => 'O/P', :input_html => { :style =>  'width:30%'}   
          f.input :strih02,:label => 'Detalle', :input_html => { :style =>  'width:30%'}  
          f.input :admin_user_id, :input_html => 
                   { :value => current_admin_user.id }, :as => :hidden    
        end
        f.actions
      end

    show :title => ' Encabezado'  do
     attributes_table do  

      row "Fecha  " do |pedid|
       if pedid.fecha1 then
        vfec=pedid.fecha1.strftime("%d-%m-%Y")
       else
        vfec="s/d"
        end
        link_to vfec, admin_header_movements_path(pedid)
      end
      row "O/P" do |pedid|
        pedid.strih01
      end
      row "Detalle" do |pedid|
        pedid.strih02
      end
      

        row "Modificado por" do |pedid|
          AdminUser.where(id:pedid.admin_user_id).
          select('email as dd').first.dd
        end 
      end

  end 
    

  
 

end
