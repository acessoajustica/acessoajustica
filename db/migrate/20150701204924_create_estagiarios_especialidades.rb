class CreateEstagiariosEspecialidades < ActiveRecord::Migration
  def change
    create_table :estagiarios_especialidades, id: false do |t|
    	t.belongs_to :estagiarios, index: true
    	t.belongs_to :especialidades, index: true
    end
  end
end