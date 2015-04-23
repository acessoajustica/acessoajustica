class CreateCalouros < ActiveRecord::Migration
  def change
    create_table :calouros do |t|

      t.timestamps null: false
    end
  end
end
