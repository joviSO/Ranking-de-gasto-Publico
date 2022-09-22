class ParliamentariansController < ApplicationController
  def index
    @parliamentarians = Parliamentarian.all
  end

  def import
    file = params[:file]
    return redirect_to users_path, notice: 'Apenas CSV por favor' unless file.content_type == 'text/csv'

    ParliamentarianService::Importer.new.call(file)

    redirect_to parliamentarians_path, notice: 'Deputados importados!'
  end

  private
    def parliamentarian_params
      params.require(:parliamentarian)
            .permit!
    end

    def budget_params
      params.require(:budget)
            .permit(
              :parliamentarian_id,
              :vlrLiquido,
              :txtFornecedor,
              :urlDocumento,
              :datEmissao
            )
    end
end
