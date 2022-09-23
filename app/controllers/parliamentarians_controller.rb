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

  def gastos
    @budgets = Budget.where(parliamentarian_id: parliamentarian_params[:id])
  end
  
  private
    def parliamentarian_params
      params.require(:parliamentarian)
            .permit(
              :id,
              :txNomeParlamentar,
              :ideCadastro,
              :sgUF
            )
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
