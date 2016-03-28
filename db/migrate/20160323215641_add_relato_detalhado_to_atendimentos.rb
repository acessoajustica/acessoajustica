class AddRelatoDetalhadoToAtendimentos < ActiveRecord::Migration
  def change
    add_column :atendimentos, :detailed_description, :string
  end
end
