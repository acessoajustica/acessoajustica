class AddEspecialidadeToAtendimentos < ActiveRecord::Migration
  def change
    add_reference :atendimentos, :especialidade, index: true
    add_foreign_key :atendimentos, :especialidades
  end
end
