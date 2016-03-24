class AddTelefoneToCliente < ActiveRecord::Migration
  def change
    add_column :clientes, :telefone_contato, :string
    rename_column :clientes, :telefone, :telefone_despesa
  end
end
