class CreateEspecialidadesAtendimentoTypes < ActiveRecord::Migration
  def change
    create_table :especialidades_atendimento_types, id: false do |t|
      t.belongs_to :especialidade, index: true
      t.belongs_to :atendimento_type, index: true
    end
  end
end
