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
    end
  end
end