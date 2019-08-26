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

  def despi2(aa,bb)
      aa1=[]
      bb1=[]

     aa2=[]
     bb2=[]

     conta=0
     while aa.length>conta 
       aa1,bb1=despi1(aa[conta])
       aa2=aa2+aa1
       bb2=bb2+bb1
       conta=conta+1
     end
      return  aa1, bb1
    end #despi2 def


    def despi3(prod)


      aa,bb=despi1(prod)
      aa1,bb1=despi2(aa,bb)
      aa2=aa+aa1
      bb2=bb+bb1

      while aa1.length>0
      aa1,bb1=despi2(aa1,bb1)   
      aa2=aa2+aa1
      bb2=bb2+bb1  
      end

      return  aa2, bb2
    end #despi3 def


    def familia(aa,bb)
      Product.update_all( pedido: 0)


     conta=0
     while aa.length>conta 
        vant=Product.where(id: aa[conta]).select('pedido as dd').first.dd+bb[conta]
        Product.where(id: aa[conta]).update_all(pedido:vant)
      
       conta=conta+1
     end
      
    end #actualiza pedido con aa y bbb








  
end
