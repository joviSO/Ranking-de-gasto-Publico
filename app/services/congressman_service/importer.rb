class CongressmanService::Importer < ApplicationService
  require 'csv'
  def call(file)
    file = File.open(file)
    csv = CSV.parse(file, headers: true, col_sep: ';')
    csv.each do |row|

      congressman_hash = {}
      congressman_hash[:name] = row['txNomeParlamentar']
      congressman_hash[:registration_code] = row['ideCadastro']
      congressman_hash[:state] = row['sgUF']

      Congressman.find_or_create_by!(congressman_hash)

      congressman_id = Congressman.find_by(registration_code: row['ideCadastro']).id
      vlrLiquido = row["vlrLiquido"]
      txtFornecedor = row["txtFornecedor"] 
      urlDocumento = row["urlDocumento"] 
      datEmissao = row["datEmissao"]
      
      BudgetService::Creater.new.call(congressman_id, vlrLiquido, txtFornecedor, urlDocumento, datEmissao)
    
    end
  end

  private
    def budget_params
      params.require(:budget)
      .permit(
        :congressmen_id,
        :vlrLiquido,
        :txtFornecedor,
        :urlDocumento,
        :datEmissao
      )
    end
end