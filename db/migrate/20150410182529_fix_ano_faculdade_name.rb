class FixAnoFaculdadeName < ActiveRecord::Migration
  def change
    rename_column :membros, :ano_facultade, :ano_faculdade
  end
end
