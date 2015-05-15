class Cliente < ActiveRecord::Base
  acts_as :pessoa
  belongs_to :estado_civil
  belongs_to :moradia_type
  belongs_to :profissao_type
  has_many :casos, dependent: :destroy
end
