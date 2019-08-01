class ReportsController < ApplicationController

    def vhoja01

      
      
        respond_to do |format|
          format.html
      
          format.xlsx{render template: 'reports/hoja01.xlsx.axlsx', xlsx:'eval'}
        end
      end


end
