class CreateHistorias < ActiveRecord::Migration
  def change
    create_table :historias do |t|
      t.string :description
      t.references :caso, index: true

      t.timestamps null: false
    end
    add_foreign_key :historias, :casos
  end
end
