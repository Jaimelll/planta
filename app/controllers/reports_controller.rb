class ReportsController < ApplicationController

    def vhoja01

      @vopc=params[:param1]
      
        respond_to do |format|
          format.html
      
          format.xlsx{render template: 'reports/hoja01.xlsx.axlsx', xlsx:'pedido'}
        end
      end


      
end
