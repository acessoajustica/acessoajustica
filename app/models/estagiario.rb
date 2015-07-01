class Estagiario < ActiveRecord::Base
  acts_as :membro
  has_and_belongs_to_many :especialidade
end
