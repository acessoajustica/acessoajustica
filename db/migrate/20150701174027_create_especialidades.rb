class CreateEspecialidades < ActiveRecord::Migration
  def change
    create_table :especialidades do |t|
      t.string :description

      t.timestamps null: false
    end

    create_table :especialidades_estagiarios, id: false do |t|
      t.belongs_to :especialidade
      t.belongs_to :estagiario
    end
  end
end
