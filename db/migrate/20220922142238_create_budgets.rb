class CreateBudgets < ActiveRecord::Migration[6.1]
  def change
    create_table :budgets do |t|
      t.float :vlrLiquido,                 null:false
      t.string :txtFornecedor
      t.string :urlDocumento
      t.datetime :datEmissao
      t.references :parliamentarian, null: false, foreign_key: true

      t.timestamps
    end
  end
end
