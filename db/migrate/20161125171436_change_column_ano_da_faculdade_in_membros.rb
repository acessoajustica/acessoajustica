class ChangeColumnAnoDaFaculdadeInMembros < ActiveRecord::Migration
  def change
  	remove_column :membros, :ano_faculdade
  	add_column :membros, :ano_faculdade, :integer, limit: 4
  end
end
