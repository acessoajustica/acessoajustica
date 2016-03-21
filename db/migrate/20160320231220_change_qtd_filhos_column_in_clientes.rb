class ChangeQtdFilhosColumnInClientes < ActiveRecord::Migration
  def change
    rename_column :clientes, :filhos_menores_quantidades, :menores_moram_quantidades
    rename_column :clientes, :filhos_maiores_quantidades, :maiores_moram_quantidades
    add_column :clientes, :menores_nao_moram_quantidades, :integer
    add_column :clientes, :maiores_nao_moram_quantidades, :integer
  end
end
