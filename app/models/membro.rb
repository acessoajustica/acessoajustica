class Membro < ActiveRecord::Base
  actable
  acts_as :pessoa
  has_one :user

  validates :nome, presence: true
  validates :cpf, presence: true
  validates :nome_da_mae, presence: true
  validates :rg, presence: true
  validates :cor, presence: true
  validates :identidade_de_genero, presence: true
  validates :ano_faculdade, numericality: { only_integer: true,
                                            less_than_or_equal_to: Time.now.year,
                                            greater_than: 1900 }
end
