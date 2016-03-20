class AtendimentoType < ActiveRecord::Base
  has_and_belongs_to_many :especialidades, :join_table => :especialidades_atendimento_types
end
