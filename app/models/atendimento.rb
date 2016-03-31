class Atendimento < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :estagiario
  belongs_to :atendimento_type
  belongs_to :atendimento_resultado
  belongs_to :especialidade

  before_save :deactivate_depending_on_atendimento_type, :if => :atendimento_type_id_changed?

  default_scope { order(created_at: :asc) }

  scope :active, -> { where(active: true) }

  validates :initial_description,
            presence: true,
            allow_blank: false

  validates :justification,
            presence: true,
            if: "atendimento_type.present?"

  #TODO quebra os testes...
  #validates :cliente, presence: true

  def deactivate!
    self.active = false
    self.save!
  end

  def self.all_for (user)
    active.where("estagiario_id = ?", Membro.find(user.membro_id).actable_id)
  end

  def self.from_beginning_of_day
    active.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def self.waiting_list
    self.from_beginning_of_day
    .where("status = true")
    .where("estagiario_id is NULL")
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

  def status_name
    if self.status
      'Aprovado'
    else
      'Não aprovado'
    end
  end

  protected
    def deactivate_depending_on_atendimento_type
      if atendimento_type.present? && atendimento_type.description == 'Orientação'
        puts "Deactivating atendimento because of atendimento_type == Orientação"
        self.active = false
        nil
      end
    end

end
