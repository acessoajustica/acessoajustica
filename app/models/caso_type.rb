class CasoType < ActiveRecord::Base
  has_and_belongs_to_many :especialidades, :join_table => :especialidades_caso_types
end
