class AddRelatoInicialToAtendimentos < ActiveRecord::Migration
  def change
    add_column :atendimentos, :initial_description, :string
  end
end
