ActiveAdmin.register Formula do

    menu false
    

    permit_params :codigo,  :obs,:cantidad, :factor, :unidad, :seccion,
                  :pedido, :for1, :for2, :for3, :for4,
                  :for5, :for6, :admin_user_id


    
    filter :codigo
    filter :seccion
    filter :obs
    
    
    index :title => "Formulación"  do
     
      prodnomb = ProductsController.new

            column("codigo")
            column("Material") do |formu|
              vmat=prodnomb.nomprod(formu.for1)
       
            end               
            column("cantidad")
            column("factor")
 
            column("obs")
              actions
          end
    
    
    
    
    
    
              form do |f|
                prodnomb = ProductsController.new
    
                   nn=Product.where(id:params[:product_id]).
                            select('nombre as dd').first.dd.capitalize
                  f.inputs "#{nn}" do
                  f.input :product_id, :label => 'Producto' ,
                           :input_html => { :value => params[:product_id]}, :as => :hidden
                  f.input :for1, :label => 'Material', :as => :select, :collection =>
                           Product.order('nombre').map{|u| [prodnomb.nomprod(u.id), u.id]}


                  f.input :codigo, :input_html => { :style =>  'width:30%'}
                  f.input :cantidad, :input_html => { :style =>  'width:30%'}
                  f.input :factor, :input_html => { :style =>  'width:30%'}
   
                  f.input :obs, :input_html => { :style =>  'width:30%'}
                  
                 
                  
                  f.input :admin_user_id, :input_html => 
                           { :value => current_admin_user.id }, :as => :hidden
               end
                  f.actions
            end
    
    
    
            show :title => ' Formulación'  do
              prodnomb = ProductsController.new

             
    
              attributes_table do
    

                row :codigo
                row "Material" do |formu|
                  vmat=prodnomb.nomprod(formu.for1)
                end                
                row :cantidad
                row :factor
  
                row :obs
             #   row :pedido
                row "Modificado por" do |formu|
                  AdminUser.where(id:formu.admin_user_id).
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
    
