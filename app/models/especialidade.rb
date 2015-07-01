class Especialidade < ActiveRecord::Base
  has_and_belongs_to_many :estagiario
end
