ActiveAdmin.register_page "Dashboard" do

   
    menu  priority: 1, label: "Inicio"
    content title: "MODULOS" do
    li link_to "Productos",  admin_products_path
    li link_to "Parámetros ",  admin_elements_path
    li link_to "Prueba",reports_vhoja01_path(format:  "xlsx") 
    end
end
