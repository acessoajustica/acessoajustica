class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.integer :filhos_quantidade
      t.string :profissao_nome
      t.string :familia_quantidade
      t.decimal :familia_renda
      t.integer :contribuintes_quantidade
      t.references :estado_civil, index: true
      t.references :moradia_type, index: true
      t.references :profissao_type, index: true

      t.timestamps null: false
    end
    add_foreign_key :clientes, :estado_civils
    add_foreign_key :clientes, :moradia_types
    add_foreign_key :clientes, :profissao_types
  end
end
