class AddResultadoToCasos < ActiveRecord::Migration
  def change
  	add_reference :casos, :caso_resultado, index: true
    add_foreign_key :casos, :caso_resultados
  end
end
