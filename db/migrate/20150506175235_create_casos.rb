class CreateCasos < ActiveRecord::Migration
  def change
    create_table :casos do |t|
      t.boolean :status

      t.timestamps null: false
    end
  end
end
