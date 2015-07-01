class RemoveColumnEspecialidadeFromEstagiarios < ActiveRecord::Migration
  def change
  	remove_column :estagiarios, :especialidade
  end
end
