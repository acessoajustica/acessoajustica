class Caso < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :estagiario
  has_many :relatos

  def self.all_of_user (user)
    where("estagiario_id = ?", Membro.find(user.membro_id).actable_id)
  end
end
