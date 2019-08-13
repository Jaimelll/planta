class DetailsController < InheritedResources::Base

  def paraele(vid,vord)
    if Detail.where(element_id:vid, id:vord).count>0 then

       exp =Detail.where(element_id:vid, id:vord).
          select('descripcion as dd').first.dd
 
    else
         exp =   "s/d"
    end

  end

  def paleac(vid,vord)
    if Detail.where(element_id:vid, id:vord).count>0 then

       exp =Detail.where(element_id:vid, id:vord).
          select('aleacion as dd').first.dd

          if exp then
            exp =Detail.where(element_id:6, id:exp).
            select('descripcion as dd').first.dd       
          else
            exp =   "s/d"
          end
    else
         exp =   0
    end

  end

  def ppeso(vid,vord)
    if Detail.where(element_id:vid, id:vord).count>0 then

       exp =Detail.where(element_id:vid, id:vord).
          select('peso as dd').first.dd


    else
         exp =   0
    end

  end

  def ssalida(vid,vord)
    if Detail.where(element_id:vid, id:vord).count>0 then

       exp =Detail.where(element_id:vid, id:vord).
          select('salidas as dd').first.dd


    else
         exp =   0
    end

  end
  def ppzaspre(vid,vord)
    if Detail.where(element_id:vid, id:vord).count>0 then

       exp =Detail.where(element_id:vid, id:vord).
          select('pzasxprens as dd').first.dd


    else
         exp =   0
    end

  end

  def pculote(vid,vord)
    if Detail.where(element_id:vid, id:vord).count>0 then

       exp =Detail.where(element_id:vid, id:vord).
          select('culote as dd').first.dd


    else
         exp =   0
    end

  end

  def ppuntas(vid,vord)
    if Detail.where(element_id:vid, id:vord).count>0 then

       exp =Detail.where(element_id:vid, id:vord).
          select('puntas as dd').first.dd


    else
         exp =   0
    end

  end



end
