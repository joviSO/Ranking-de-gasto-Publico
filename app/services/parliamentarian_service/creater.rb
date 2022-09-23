class ParliamentarianService::Creater < ApplicationService
  
  def call(csv)  
    csv.each do |row|

      parliamentarian_hash = {}
      parliamentarian_hash[:txNomeParlamentar] = row['txNomeParlamentar']
      parliamentarian_hash[:ideCadastro] = row['ideCadastro']
      parliamentarian_hash[:sgUF] = row['sgUF']

      Parliamentarian.find_or_create_by!(parliamentarian_hash)

      parliamentarian_id = Parliamentarian.find_by(ideCadastro: row['ideCadastro']).id
      vlrLiquido = row["vlrLiquido"]
      txtFornecedor = row["txtFornecedor"] 
      urlDocumento = row["urlDocumento"] 
      datEmissao = row["datEmissao"]
      
      BudgetService::Creater.new.call(parliamentarian_id, vlrLiquido, txtFornecedor, urlDocumento, datEmissao)
    end

    { success: true, message: "Deputados registrados com sucesso" }
  rescue StandardError => e
    { success: false, error: e.message  }
  end
end