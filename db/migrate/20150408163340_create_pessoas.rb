class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.string :cpf
      t.string :nome_da_mae
      t.string :rg
      t.string :cor
      t.string :identidade_de_genero

      t.timestamps null: false
    end
  end
end
