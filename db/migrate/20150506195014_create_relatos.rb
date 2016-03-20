class CreateRelatos < ActiveRecord::Migration
  def change
    create_table :relatos do |t|
      t.string :description
      t.references :atendimento, index: true

      t.timestamps null: false
    end
    add_foreign_key :relatos, :atendimentos
  end
end
