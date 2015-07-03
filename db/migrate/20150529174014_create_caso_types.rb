class CreateCasoTypes < ActiveRecord::Migration
  def change
    create_table :caso_types do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
