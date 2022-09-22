class CreateBudgets < ActiveRecord::Migration[6.1]
  def change
    create_table :budgets do |t|
      t.references :congressmen, null: false, foreign_key: true

      t.float :vlrLiquido,                null: false
      t.string :txtFornecedor
      t.string :urlDocumento
      t.datetime :datEmissao

      t.timestamps
    end
  end
end
