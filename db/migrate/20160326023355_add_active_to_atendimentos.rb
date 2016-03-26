class AddActiveToAtendimentos < ActiveRecord::Migration
  def change
    add_column :atendimentos, :active, :boolean, default: true
  end
end
