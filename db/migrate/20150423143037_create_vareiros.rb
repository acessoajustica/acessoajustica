class CreateVareiros < ActiveRecord::Migration
  def change
    create_table :vareiros do |t|
      t.string :forum

      t.timestamps null: false
    end
  end
end
