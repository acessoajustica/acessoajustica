class AddJustificationToAtendimentos < ActiveRecord::Migration
  def change
    add_column :atendimentos, :justification, :string
  end
end
