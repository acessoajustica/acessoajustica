class AddAprovadoColumnToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :aprovado, :boolean
  end
end
