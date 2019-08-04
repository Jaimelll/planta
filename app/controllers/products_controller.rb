class ProductsController < ApplicationController

  def nomprod(vord)
    if Product.where(id:vord).count>0 then
      Product.where(id:vord).select('nombre as dd').first.dd    
    else
         exp =   "s/d"
    end

  end




end
