class DetailsController < InheritedResources::Base

  def paraele(vid,vord)
    if Detail.where(element_id:vid, id:vord).count>0 then

       exp =Detail.where(element_id:vid, id:vord).
          select('descripcion as dd').first.dd

    else
         exp =   "s/d"
    end

  end



end
