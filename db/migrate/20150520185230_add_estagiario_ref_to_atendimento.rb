class AddEstagiarioRefToAtendimento < ActiveRecord::Migration
  def change
    add_reference :atendimentos, :estagiario, index: true
    add_foreign_key :atendimentos, :estagiarios
  end
end
