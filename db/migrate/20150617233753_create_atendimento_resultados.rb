class CreateAtendimentoResultados < ActiveRecord::Migration
  def change
    create_table :atendimento_resultados do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
