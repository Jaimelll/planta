class ElementsController < InheritedResources::Base

  private

    def element_params
      params.require(:element).permit(:nombre)
    end

end
