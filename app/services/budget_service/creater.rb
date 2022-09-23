class BudgetService::Creater < ApplicationService

  def call(parliamentarian_id, vlrLiquido, txtFornecedor, urlDocumento, datEmissao)
    budget_hash = {}
    budget_hash[:parliamentarian_id] = parliamentarian_id
    budget_hash[:vlrLiquido] = vlrLiquido
    budget_hash[:txtFornecedor] = txtFornecedor
    budget_hash[:urlDocumento] = urlDocumento
    budget_hash[:datEmissao] = datEmissao

    Budget.find_or_create_by!(budget_hash)

    { success: true, message: "Gastos registrados com sucesso" }
  rescue StandardError => e
    { success: false, error: e.message  }    
  end
end
