class FormulasController < InheritedResources::Base

  private

    def formula_params
      params.require(:formula).permit(:codigo)
    end

end
