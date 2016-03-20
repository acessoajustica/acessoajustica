class RenameColumnEnderecoFromCliente < ActiveRecord::Migration
  def change
    rename_column :clientes, :endereço, :endereco
  end
end
