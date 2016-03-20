class CreateAtendimentos < ActiveRecord::Migration
  def change
    create_table :atendimentos do |t|
      t.boolean :status
      t.references :cliente, index: true

      t.timestamps null: false
    end
    add_foreign_key :atendimentos, :clientes
  end
end
