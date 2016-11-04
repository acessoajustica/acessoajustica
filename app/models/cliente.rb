class Cliente < ActiveRecord::Base
  acts_as :pessoa
  belongs_to :estado_civil
  belongs_to :moradia_type
  belongs_to :profissao_type
  has_many :atendimentos, dependent: :destroy

  validates :aprovado, :presence => true


  scope :search, -> (search) { joins(:pessoa).where("lower(nome) like :search
  								        or CPF like :search", search: "%#{search.downcase}%")
    								}

  scope :from_estagiario, -> (estagiario_id) { joins(:pessoa, :atendimentos).where("atendimentos.estagiario_id = :estagiario_id AND atendimentos.cliente_id = pessoas.actable_id AND pessoas.actable_type = 'Cliente'", estagiario_id: "#{estagiario_id}") }

  def moradia_description
  	if (moradia_type)
  	  moradia_type.description
  	end
  end

  def estado_civil_description
  	if (estado_civil)
  	  estado_civil.description
  	end
  end

  def profissao_type_description
    if (profissao_type)
      profissao_type.description
    end
  end

end
