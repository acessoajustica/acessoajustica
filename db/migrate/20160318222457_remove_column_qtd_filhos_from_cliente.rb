class RemoveColumnQtdFilhosFromCliente < ActiveRecord::Migration
  def change
    remove_column :clientes, :filhos_quantidade, :integer
  end
end
