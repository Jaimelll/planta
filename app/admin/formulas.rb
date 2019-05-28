ActiveAdmin.register Formula do

    menu false
    

    permit_params :codigo,  :obs,:cantidad, :factor, :unidad, :seccion,
                  :pedido, :for1, :for2, :for3, :for4,
                  :for5, :for6, :admin_user_id


    
    filter :codigo
    filter :seccion
    filter :obs
    
    
    index :title => "Formulación"  do
      def paraele(vid,vord)
        if Detail.where(element_id:vid, id:vord).count>0 then
  
           exp =Detail.where(element_id:vid, id:vord).
              select('descripcion as dd').first.dd
  
        else
             exp =   "s/d"
        end
  
      end

            column("Producto")do |mat|
               Product.where(id:mat.product_id).select('nombre as dd').first.dd
            end  
            column("codigo")
            column("Material") do |producto|
              if Product.where(id:producto.for1).count>0 then
                Product.where(id:producto.for1).select('nombre as dd').first.dd
              end
            end               
            column("cantidad")
            column("factor")
            column("unidad") do |mat|
              paraele(1,mat.unidad)
            end  
            column("seccion")
            column("pedido")
            column("obs")
              actions
          end
    
    
    
    
    
    
              form do |f|
    
    
                   nn=Product.where(id:params[:product_id]).
                            select('nombre as dd').first.dd.capitalize
                  f.inputs "#{nn}" do
                  f.input :product_id, :label => 'Producto' ,
                           :input_html => { :value => params[:product_id]}, :as => :hidden
                  f.input :for1, :label => 'Material', :as => :select, :collection =>
                           Product.order('nombre').map{|u| [u.nombre, u.id]}


                  f.input :codigo, :input_html => { :style =>  'width:30%'}
                  f.input :cantidad, :input_html => { :style =>  'width:30%'}
                  f.input :factor, :input_html => { :style =>  'width:30%'}
                  f.input :unidad,:label => 'Unidad de medida', :as => :select, :collection =>
                             Detail.where(element_id:1).map{|u| [u.descripcion, u.id]}
                  f.input :seccion, :input_html => { :style =>  'width:30%'}
                  f.input :obs, :input_html => { :style =>  'width:30%'}
                  
                 
                  
                  f.input :admin_user_id, :input_html => 
                           { :value => current_admin_user.id }, :as => :hidden
               end
                  f.actions
            end
    
    
    
            show :title => ' Producto'  do
              def paraele(vid,vord)
                if Detail.where(element_id:vid, id:vord).count>0 then
          
                   exp =Detail.where(element_id:vid, id:vord).
                      select('descripcion as dd').first.dd
          
                else
                     exp =   "s/d"
                end
          
              end    
    
              attributes_table do
    
                nn=Product.where(id:params[:product_id]).
                         select('nombre as dd').first.dd.capitalize
    
               

              
                row "Producto" do |mat|
                  link_to "#{nn}", admin_product_formulas_path(mat.product_id)
                end 
                row :codigo
                row "Material" do |producto|
                  if Product.where(id:producto.for1).count >0 then
                    Product.where(id:producto.for1).select('nombre as dd').first.dd
                  end
                end                
                row :cantidad
                row :factor
                row :unidad do |producto|
                  paraele(1,producto.unidad)
                end
                row :seccion
                row :acti
                row :obs
             #   row :pedido
                row "Modificado por" do |prod|
                  AdminUser.where(id:prod.admin_user_id).
                  select('email as dd').first.dd
                end 
              end
    
          end
    
          sidebar "Producto" do
            if params[:product_id] then
              
              nn="ir a."+Product.where(id:params[:product_id]).
              select('nombre as dd').first.dd.capitalize

          
           
              li link_to "#{nn}",  admin_product_path(params[:product_id])
         
           
          
          
          end# de if
          end # de sider
    
    
    
    
    end
    
