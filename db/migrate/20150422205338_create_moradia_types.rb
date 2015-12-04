class CreateMoradiaTypes < ActiveRecord::Migration
  def change
    create_table :moradia_types do |t|
      t.string :description

      t.timestamps null: false
    end
      add_index :moradia_types, :description, unique: true
  end
end
