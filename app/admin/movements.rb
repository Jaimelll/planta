ActiveAdmin.register Movement do

  menu false
    

  permit_params :intm01, :intm02, :intm03, :intm04, 
                :intm05, :intm06, :intm07, :intm08,:intm09, :intm10,
                :strim01, :strim02, :strim03, :strim04, 
                :floam01, :floam02, :floam03, :floam04, 
                :floam05, :floam06, :floam07, :floam08, :floam09, :floam10,
                :header_id, :admin_user_id


   filter :floam02, label:'Cantidad'
  
  
  index :title => "Movimiento"  do
 
    detnomb = DetailsController.new
    prodnomb = ProductsController.new

          column("Material") do |movim|
           vmat=prodnomb.nomprod(movim.intm01)
             link_to vmat, admin_header_path(movim.header_id)
          end   

          column("Unidad") do |movim|
             detnomb.paraele(1,movim.intm02)
          end  
          column("Cantidad")do |movim|
             movim.floam02
          end  
          column("Perfil") do |movim|
            detnomb.paraele(5,movim.intm03)
          end  
          column("Aleacion")do |movim|
            detnomb.paraele(6,movim.intm04)          
          end 
          column("Peso(kg)")do |movim|
            movim.floam04
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


                f.input :intm02,:label => 'Unidad de medida', :as => :select, :collection =>
                         Detail.where(element_id:1).map{|u| [u.descripcion, u.id]}
                         
                f.input :floam02, :label => 'Cantidad', :input_html => { :style =>  'width:30%'}

                f.input :floam03, :label => 'Longitud', :input_html => { :style =>  'width:30%'}
                f.input :intm03, :label => 'Perfil', :as => :select, :collection =>
                         Detail.where(element_id:5).map{|u| [u.descripcion, u.id]}
                f.input :intm04, :label => 'Aleacion', :as => :select, :collection =>
                         Detail.where(element_id:6).map{|u| [u.descripcion, u.id]}

                f.input :floam04, :label => 'Peso(kg)', :input_html => { :style =>  'width:30%'}

                f.input :intm05, :label => 'Salidas', :input_html => { :style =>  'width:30%'}             
                f.input :intm06, :label => 'Piezas x prensada', :input_html => { :style =>  'width:30%'}
                f.input :floam05, :label => 'Culote', :input_html => { :style =>  'width:30%'}
                f.input :floam06, :label => 'Puntas', :input_html => { :style =>  'width:30%'}
                
                f.input :admin_user_id, :input_html => 
                         { :value => current_admin_user.id }, :as => :hidden
             end
                f.actions
          end
  
  
  
          show :title => ' Movimiento'  do

  
            attributes_table do

              detnomb = DetailsController.new
              prodnomb = ProductsController.new
          
              row "Material" do |movim|
                  
                   vmat=prodnomb.nomprod(movim.intm01)
                   link_to vmat, admin_header_movements_path(movim.header_id)

              end   

    
              row "Unidad" do |movim|
                 detnomb.paraele(1,movim.intm02)
              end  
              row "Cantidad" do |movim|
                 movim.floam02
              end                
              row "Perfil" do |movim|
                detnomb.paraele(5,movim.intm03)
              end  
              row "Aleacion" do |movim|
                detnomb.paraele(6,movim.intm04)          
              end 
              row "Peso(kg)" do |movim|
                movim.floam04
              end 

              row "Salidas" do |movim|
                movim.intm05
              end 
              row "Piezas x prensada" do |movim|
                movim.intm06
              end 
              row "Culote" do |movim|
                movim.floam05
              end 
              row "Puntas" do |movim|
                movim.floam06
              end 

              row "Modificado por" do |movim|
                AdminUser.where(id:movim.admin_user_id).
                select('email as dd').first.dd
              end 
            end
  
        end
  
        sidebar  " Pedido ",:only => [:show, :index]  do
          if params[:id] then
             vpara=params[:id]
          else
            vpara=params[:header_id]
          end
       

          Header.where(id:vpara).each do |encab|
           li "Fecha  : "+ encab.fecha1.to_s
           li "O/P    :"+ encab.strih01
           li "Detalle:"+encab.strih02
          end
        end  






      
end
