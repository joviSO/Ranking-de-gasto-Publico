class CreateParliamentarians < ActiveRecord::Migration[6.1]
  def change
    create_table :parliamentarians do |t|
      t.string :txNomeParlamentar,        null:false
      t.integer :ideCadastro,             null:false, unique: true
      t.string :sgUF,                     null:false

      t.timestamps
    end
  end
end
