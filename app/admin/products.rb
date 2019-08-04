ActiveAdmin.register Product do
    # See permitted parameters documentation:
    # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
    #
    # permit_params :list, :of, :attributes, :on, :model
    #
    # or
    #
    # permit_params do
    #   permitted = [:permitted, :attributes]
    #   permitted << :other if params[:action] == 'create' && current_user.admin?
    #   permitted
    # end
    
    #menu if: proc{ current_admin_user.categoria==2 }, priority: 3, label: "Productos"

    
    
    permit_params :codigo, :nombre, :descripcion, :precio, :costo,
                  :unidad, :seccion, :inventario, :pedido, :clase,
                  :familia, :nivel, :fecha, :orden,:activo, :admin_user_id
    
    menu  priority: 2, label: "Productos"
    
    ActiveAdmin.register Formula do
      belongs_to :product
    end
    


    filter :codigo
    filter :nombre
    filter :descripcion
    
    







   index :title => 'Lista de Productos' do

    detnomb = DetailsController.new

     column("codigo") 
      column("nombre") do |producto|
          link_to "#{producto.nombre} ", admin_product_formulas_path(producto)
      end
      
      
      column("descripcion")
      column("unidad") do |producto|
        detnomb.paraele(1,producto.unidad)
      end  
      column("activo") do |producto|
        detnomb.paraele(2,producto.activo)
      end  
      column("seccion") do |producto|
        detnomb.paraele(3,producto.seccion)
      end  
      column("familia") do |producto|
        detnomb.paraele(4,producto.familia)
      end  

      column("orden")
    
    
        actions
    end
    
    
    
    form do |f|
    
      f.inputs "Products" do
            f.input :codigo
            f.input :nombre
            f.input :descripcion
            

            f.input :unidad,:label => 'Unidad de medida', :as => :select, :collection =>
            Detail.where(element_id:1).map{|u| [u.descripcion, u.id]}
            f.input :activo,:label => 'Activo', :as => :select, :collection =>
            Detail.where(element_id:2).map{|u| [u.descripcion, u.id]}
            f.input :seccion,:label => 'Seccion', :as => :select, :collection =>
            Detail.where(element_id:3).map{|u| [u.descripcion, u.id]}
            f.input :familia,:label => 'Familia', :as => :select, :collection =>
            Detail.where(element_id:4).map{|u| [u.descripcion, u.id]}

            f.input :orden
            f.input :admin_user_id, :input_html => 
                    { :value => current_admin_user.id }, :as => :hidden

      end
    
    
    
         f.actions
    
    end
    
    
    show do
      def paraele(vid,vord)
        if Detail.where(element_id:vid, id:vord).count>0 then
  
           exp =Detail.where(element_id:vid, id:vord).
              select('descripcion as dd').first.dd
  
        else
             exp =   "s/d"
        end
  
      end
    
              attributes_table do
                row :codigo
                row ("nombre") do |producto|
                  link_to "#{producto.nombre} ", admin_product_formulas_path(producto)
                end
               
                row :nombre
                row :descripcion
               
                row :unidad do |producto|
                  paraele(1,producto.unidad)
                end
                row :activo do |producto|
                  paraele(2,producto.activo)
                end
                row :seccion do |producto|
                  paraele(3,producto.seccion)
                end
                row :familia do |producto|
                  paraele(4,producto.familia)
                end                                                
                row :orden
                row "Modificado por" do |prod|
                  AdminUser.where(id:prod.admin_user_id).
                  select('email as dd').first.dd
                end 
              end
    
          end
    
    
    
    
    end
    