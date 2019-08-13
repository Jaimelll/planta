ActiveAdmin.register Detail do
    menu false
    
  

    permit_params :codigo,  :descripcion,:cantidad, :orden1, :orden2,
                 :id_element, :admin_user_id,
                 :longitud, :perfil, :aleacion, :peso,
                 :salidas, :pzasxprens, :culote, :puntas
    
    filter :codigo
    filter :descripcion
    filter :orden1
    filter :orden2
    
    
    index :title => "Detalle"  do

            column("Parametro")do |mat|
               Element.where(id:mat.element_id).select('descripcion as dd').first.dd
            end  
            column("codigo")
           
            column("descripcion")
            column("orden1")
            column("orden2")
            column("cantidad")
     
              actions
          end
    
    
    
    
    
    
              form do |f|
    
    
                   nn=Element.where(id:params[:element_id]).
                            select('descripcion as dd').first.dd.capitalize
                  f.inputs "#{nn}" do
                  f.input :element_id, :label => 'Paramentro' ,
                           :input_html => { :value => params[:element_id]}, :as => :hidden
                  
                  f.input :codigo, :input_html => { :style =>  'width:30%'}
                  f.input :descripcion, :input_html => { :style =>  'width:30%'}
                  f.input :orden1, :input_html => { :style =>  'width:30%'}
                  f.input :orden2, :input_html => { :style =>  'width:30%'}
                  f.input :cantidad, :input_html => { :style =>  'width:30%'}

                  f.input :longitud, :label => 'Longitud', :input_html => { :style =>  'width:30%'}

                  f.input :aleacion, :label => 'Aleacion', :as => :select, :collection =>
                           Detail.where(element_id:6).map{|u| [u.descripcion, u.id]}
  
                  f.input :peso, :label => 'Peso(kg)', :input_html => { :style =>  'width:30%'}
  
                  f.input :salidas, :label => 'Salidas', :input_html => { :style =>  'width:30%'}             
                  f.input :pzasxprens, :label => 'Piezas x prensada', :input_html => { :style =>  'width:30%'}
                  f.input :culote, :label => 'Culote', :input_html => { :style =>  'width:30%'}
                  f.input :puntas, :label => 'Puntas', :input_html => { :style =>  'width:30%'}
                  
                 
                  
                  f.input :admin_user_id, :input_html => 
                           { :value => current_admin_user.id }, :as => :hidden
               end
                  f.actions
            end
    
    
    
    show do
    
    
              attributes_table do
    
                nn=Element.where(id:params[:element_id]).
                select('descripcion as dd').first.dd.capitalize

                detnomb = DetailsController.new
              

              
                row "Parametro" do |deta|
                  link_to "#{nn}", admin_element_details_path(deta.element_id)
                end 
                row :codigo
                row :descripcion
                row :orden1
                row :orden2
                row :cantidad
                row :longitud
              
                row "Aleacion" do |deta|
                  detnomb.paraele(6,deta.aleacion)          
                end 

                row "Peso(kg)" do |movim|
                  movim.peso
                end 
  
                row "Salidas" do |movim|
                  movim.salidas
                end 
                row "Piezas x prensada" do |movim|
                  movim.pzasxprens
                end 
                row "Culote" do |movim|
                  movim.culote
                end 
                row "Puntas" do |movim|
                  movim.puntas
                end 




                row "Modificado por" do |prod|
                  AdminUser.where(id:prod.admin_user_id).
                  select('email as dd').first.dd
                end 
              end
    
          end
    
          sidebar "Parametro" do
            if params[:element_id] then
              
              nn="ir a."+Element.where(id:params[:element_id]).
              select('descripcion as dd').first.dd.capitalize

          
           
              li link_to "#{nn}",  admin_element_path(params[:element_id])
         
           
          
          
          end# de if
          end # de sider
    
end
