class HeadersController < InheritedResources::Base

    def mmov(vord)
   
        if Detail.where(element_id:8,orden1:vord).count>0 then
           exp= Detail.where(element_id:8,orden1:vord).
           select('descripcion as dd').first.dd 
    
    
        else
             exp =   "Falta movimiento"
        end
    
      end


      def acproduc()
        vdesp1=MovementsController.new

        Product.where.not(pedido:0).update_all(pedido:0)


        # pedidos inth01:1
        Header.where(inth01:1).each do |enca1|
        
        Movement.where(header_id:enca1.id).each do |mov|
        
                      
        
        
        vaa,vbb=vdesp1.despi3(mov.intm01)
        
        
        contt=vaa.length
        while contt>0 
        
        
        
        
        vant=Product.where(id: vaa[contt-1]).select('pedido as dd').first.dd+mov.floam02*vbb[contt-1]
         Product.where(id: vaa[contt-1]).update_all(pedido:vant)
        contt=contt-1
        
        
        
        
        
        end # while
        
        
        
        end  # de movement     
        
        end    # de header 



      end




end
