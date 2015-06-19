class CreateCasoResultados < ActiveRecord::Migration
  def change
    create_table :caso_resultados do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
