class AddResultadoToAtendimentos < ActiveRecord::Migration
  def change
  	add_reference :atendimentos, :atendimento_resultado, index: true
    add_foreign_key :atendimentos, :atendimento_resultados
  end
end
