class Caso < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :estagiario
  has_many :relatos
  belongs_to :caso_type
  belongs_to :caso_resultado

  def self.all_for (user)
    where("estagiario_id = ?", Membro.find(user.membro_id).actable_id)
  end

  def self.from_beginning_of_day
    casos = self.where("created_at >= ?", Time.zone.now.beginning_of_day).select do |caso|
      caso.status == true and caso.estagiario == nil    
    end
    casos
  end

  def type_description
  	if (caso_type)
  	  caso_type.description
  	end
  end
end
