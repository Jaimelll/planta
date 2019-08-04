ActiveAdmin.register Detail do
    menu false
    
  

    permit_params :codigo,  :descripcion,:cantidad, :orden1, :orden2,
                 :id_element, :admin_user_id


    
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


                 
                  
                  f.input :admin_user_id, :input_html => 
                           { :value => current_admin_user.id }, :as => :hidden
               end
                  f.actions
            end
    
    
    
    show do
    
    
              attributes_table do
    
                nn=Element.where(id:params[:element_id]).
                select('descripcion as dd').first.dd.capitalize
               

              
                row "Parametro" do |deta|
                  link_to "#{nn}", admin_element_details_path(deta.element_id)
                end 
                row :codigo
                row :descripcion
                row :orden1
                row :orden2
                row :cantidad

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
