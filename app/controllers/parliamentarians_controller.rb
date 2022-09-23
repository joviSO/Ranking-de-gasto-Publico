class ParliamentariansController < ApplicationController 
  before_action :set_parliamentarian, only: %i[gastos]  

  def index
    @parliamentarians_total = Parliamentarian.all
    @parliamentarians = Parliamentarian.order(:id).page(params[:page]).per(10)
  end

  def import
    file = params[:file]
    unless file.nil?
      return redirect_to users_path, notice: 'Apenas CSV por favor' unless file.content_type == 'text/csv'
  
      ParliamentarianService::Importer.new.call(file)
  
      redirect_to parliamentarians_path
    else
      return redirect_to parliamentarians_path, notive: 'Por favor insira um CSV' 
    end
  end

  def gastos
    @budgets_total = Budget.where(parliamentarian_id: @parliamentarian)
    @budgets = Budget.where(parliamentarian_id: @parliamentarian).page(params[:page]).per(10)
  end
  
  private
    def parliamentarian_params
      params.permit(
              :id,
              :txNomeParlamentar,
              :ideCadastro,
              :sgUF
            )
    end

    def set_parliamentarian
      @parliamentarian = Parliamentarian.find(params[:id])
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
