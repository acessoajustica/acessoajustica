class AddTypeToAtendimentos < ActiveRecord::Migration
  def change
    add_reference :atendimentos, :atendimento_type, index: true
    add_foreign_key :atendimentos, :atendimento_types
  end
end
