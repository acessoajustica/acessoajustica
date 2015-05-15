class Estagiario < ActiveRecord::Base
  acts_as :membro

  validates :especialidade, presence: true
end
