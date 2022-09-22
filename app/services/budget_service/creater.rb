class BudgetService::Creater < ApplicationService

  def call(congressman_id, vlrLiquido, txtFornecedor, urlDocumento, datEmissao)
    budget_hash = {}
    budget_hash[:congressmen_id] = congressman_id
    budget_hash[:vlrLiquido] = vlrLiquido
    budget_hash[:txtFornecedor] = txtFornecedor
    budget_hash[:urlDocumento] = urlDocumento
    budget_hash[:datEmissao] = datEmissao

    Budget.find_or_create_by!(budget_hash)      
  end

  private
  def congressman_params
    params.require(:congressman)
          .permit(:id)
    
  end
  
end
