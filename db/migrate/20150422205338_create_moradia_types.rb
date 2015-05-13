class CreateMoradiaTypes < ActiveRecord::Migration
  def change
    create_table :moradia_types do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
