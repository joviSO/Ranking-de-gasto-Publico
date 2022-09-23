class ParliamentariansController < ApplicationController

  def visualizar_gasto
    
  end

  private

    def parliamentarian_params
      params.require(:parliamentarian)
            .permit!
    end

    def budget_params
      params.require(:budget)
            .permit!
    end
end