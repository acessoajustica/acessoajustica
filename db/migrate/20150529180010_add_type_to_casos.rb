class AddTypeToCasos < ActiveRecord::Migration
  def change
    add_reference :casos, :caso_type, index: true
    add_foreign_key :casos, :caso_types
  end
end
