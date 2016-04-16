class CreateCors < ActiveRecord::Migration
  def change
    create_table :cors do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
