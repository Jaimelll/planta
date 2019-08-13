class ProductsController < ApplicationController

  def nomprod(vord)
    detnomb = DetailsController.new
    if Product.where(id:vord).count>0 then
      
      vuni=Product.where(id:vord).select('unidad as dd').first.dd 
      vnpro= Product.where(id:vord).select('nombre as dd').first.dd+ " ( "+
      detnomb.paraele(1,vuni)+" )"

    else
         exp =   "s/d"
    end

  end




end
