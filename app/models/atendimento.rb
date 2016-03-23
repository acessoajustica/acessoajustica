class Atendimento < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :estagiario
  has_many :relatos
  belongs_to :atendimento_type
  belongs_to :atendimento_resultado

  def self.all_for (user)
    where("estagiario_id = ?", Membro.find(user.membro_id).actable_id)
  end

  def self.from_beginning_of_day
    atendimentos = self.where("created_at >= ?", Time.zone.now.beginning_of_day).select do |atendimento|
      atendimento.status == true and atendimento.estagiario == nil
    end
    atendimentos
  end

  def type_description
    if (atendimento_type)
      atendimento_type.description
    end
  end

  def canTakeMe?(estagiario)
    intersection = atendimento_type.especialidades & estagiario.especialidades
    intersection.any?
  end

end
