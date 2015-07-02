class CreateEspecialidadesCasoTypes < ActiveRecord::Migration
  def change
    create_table :especialidades_caso_types, id: false do |t|
      t.belongs_to :especialidade, index: true
      t.belongs_to :caso_type, index: true
    end
  end
end
