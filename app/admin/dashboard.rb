ActiveAdmin.register_page "Dashboard" do

   
    menu  priority: 1, label: "Inicio"
    content title: "MODULOS" do
        

    li link_to "Pedido",reports_vhoja01_path(format:  "xlsx", :param1=> 1) 
    li link_to "Matriz",reports_vhoja01_path(format:  "xlsx", :param1=> 2) 
    li link_to "Cortes",reports_vhoja01_path(format:  "xlsx", :param1=> 3) 
    li link_to "Programa",reports_vhoja01_path(format:  "xlsx", :param1=> 4) 
    end
end
