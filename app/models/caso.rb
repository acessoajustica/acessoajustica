class Caso < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :estagiario
  has_many :relatos
  has_one :caso_type
end
