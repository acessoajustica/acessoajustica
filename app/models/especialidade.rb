class Especialidade < ActiveRecord::Base
  has_many :atendimentos
end
