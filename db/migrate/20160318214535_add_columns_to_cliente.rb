class AddColumnsToCliente < ActiveRecord::Migration
  def change
    add_column :clientes, :endereço, :string
    add_column :clientes, :bairro, :string
    add_column :clientes, :cep, :string
    add_column :clientes, :cidade, :string
    add_column :clientes, :estado, :string
    add_column :clientes, :tem_filhos, :boolean
    add_column :clientes, :filhos_menores_quantidades, :integer
    add_column :clientes, :filhos_maiores_quantidades, :integer
    add_column :clientes, :faz_bicos, :boolean
    add_column :clientes, :salario, :decimal
    add_column :clientes, :contribuicao_valor, :decimal
    add_column :clientes, :alimentacao_despesa, :decimal
    add_column :clientes, :saude, :decimal
    add_column :clientes, :aluguel, :decimal
    add_column :clientes, :condominio, :decimal
    add_column :clientes, :agua, :decimal
    add_column :clientes, :luz, :decimal
    add_column :clientes, :gas, :decimal
    add_column :clientes, :telefone, :decimal
    add_column :clientes, :transporte, :decimal
    add_column :clientes, :educacao, :decimal
    add_column :clientes, :obrigacoes_judiciais, :decimal
    add_column :clientes, :financiamentos, :decimal
    add_column :clientes, :iptu, :decimal
    add_column :clientes, :total_despesas_fixas, :decimal
    add_column :clientes, :valor_liquido_rendimento_mensal, :decimal
  end
end
