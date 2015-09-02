class Cliente < ActiveRecord::Base
  acts_as :pessoa
  belongs_to :estado_civil
  belongs_to :moradia_type
  belongs_to :profissao_type
  has_many :casos, dependent: :destroy


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