class HeadersController < InheritedResources::Base

  private

    def header_params
      params.require(:header).permit(:fecha1)
    end

end
