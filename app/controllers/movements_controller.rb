class MovementsController < InheritedResources::Base

  def despi1(prod)
   
     aa=[]
     bb=[]
     if Formula.where(product_id:prod).count>0 then
        Formula.where(product_id:prod).each do |formu| 
           aa.push(formu.for1)
           bb.push(formu.cantidad*formu.factor)
    
        end #formala each
     end#despi1 if 
     return  aa, bb
  end #despi1 def









  
end
