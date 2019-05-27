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
      column("nombre") do |producto|
          link_to "#{producto.nombre} ", admin_product_formulas_path(producto)
      end
      column("codigo") 
      column("nombre")     
      column("descripcion")
      column("unidad")
      column("orden")
    
    
        actions
    end
    
    
    
    form do |f|
    
      f.inputs "Products" do
            f.input :codigo
            f.input :nombre
            f.input :descripcion
            f.input :unidad
            f.input :orden
            f.input :admin_user_id, :input_html => 
                    { :value => current_admin_user.id }, :as => :hidden

      end
    
    
    
         f.actions
    
    end
    
    
    show do
    
    
              attributes_table do
    
                row ("nombre") do |producto|
                  link_to "#{producto.nombre} ", admin_product_formulas_path(producto)
                end
                row :codigo
                row :nombre
                row :descripcion
                row :unidad
                row :orden
                row "Modificado por" do |prod|
                  AdminUser.where(id:prod.admin_user_id).
                  select('email as dd').first.dd
                end 
              end
    
          end
    
    
    
    
    end
    