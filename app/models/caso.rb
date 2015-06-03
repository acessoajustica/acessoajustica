class Caso < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :estagiario
  has_many :relatos
  belongs_to :caso_type

  def self.all_of_user (user)
    where("estagiario_id = ?", Membro.find(user.membro_id).actable_id)
  end

  def type_description
  	if (caso_type)
  	  caso_type.description
  	end
  end
end
