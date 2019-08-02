
  ActiveAdmin.register Header, as: 'Pedidos' do
  menu  priority: 10,label: "Pedido"

  

    permit_params :fecha1
    filter :fecha1
      index :title => "Encabezado de pedido"  do
        column("fecha1")
        actions 
      end

      form do |f|
        f.inputs "Encabezado" do
          f.input :fecha1
         
        
        end
        f.actions
      end
  
    

  
 

end
