class HeadersController < InheritedResources::Base

    def mmov(vord)
   
        if Detail.where(element_id:8,orden1:vord).count>0 then
           exp= Detail.where(element_id:8,orden1:vord).
           select('descripcion as dd').first.dd 
    
    
        else
             exp =   "Falta movimiento"
        end
    
      end

end
