class CreateEstagiariosEspecialidades < ActiveRecord::Migration
  def change
    create_table :estagiarios_especialidades, id: false do |t|
    	t.belongs_to :estagiario, index: true
    	t.belongs_to :especialidade, index: true
    end
  end
end