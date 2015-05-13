class CreateEstadoCivils < ActiveRecord::Migration
  def change
    create_table :estado_civils do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
