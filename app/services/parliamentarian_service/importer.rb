class ParliamentarianService::Importer < ApplicationService
  require 'csv'
  
  def call(file)
    file = File.open(file)
    csv = CSV.parse(file, headers: true, col_sep: ';')
    
    ParliamentarianService::Creater.new.call(csv)
    
    { success: true, message: "Importação Realizada com sucesso" }
  rescue StandardError => e
    { success: false, error: e.message  }
  end
end
