class CreateCasos < ActiveRecord::Migration
  def change
    create_table :casos do |t|
      t.boolean :status
      t.references :cliente, index: true

      t.timestamps null: false
    end
    add_foreign_key :casos, :clientes
  end
end
